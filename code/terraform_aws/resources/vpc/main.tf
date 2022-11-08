################################################################################
# Local variables declaration
################################################################################
locals {
  # Concatenate variable Name and module name
  name = "${var.Name}-${replace(basename(path.cwd), "_", "-")}"

  tags = merge(var.resource_Tags, var.Tags)

  # Adjust the number of subnets acceptable into the VPC 
  N_Subnets = var.N_Subnets < 1 ? 1 : var.N_Subnets > 6 ? 6 : var.N_Subnets

  # Define de amount of instances per subnet
  instances_per_subnet = 1
}

################################################################################
# VPC Module
################################################################################
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = ">= 3.18.1"

  name = local.name
  cidr = var.vpc_CIDR

  reuse_nat_ips       = true             # Skip creation of EIPs for the NAT Gateways
  external_nat_ip_ids = aws_eip.nat.*.id # IPs specified here as input to the module

  azs             = data.aws_availability_zones.available.names
  private_subnets = slice(var.vpc_private_subnet_cidr_blocks, 0, ceil(local.N_Subnets / 2) != 0 ? ceil(local.N_Subnets / 2) : 1)
  public_subnets  = slice(var.vpc_public_subnet_cidr_blocks, 0, floor(local.N_Subnets / 2) != 0 ? floor(local.N_Subnets / 2) : 1)

  #  private_subnet_names = ["${local.name}-private-${var.region}-01", "${local.name}-private-${var.region}-02", "${local.name}-private-${var.region}-03"]
  #  public_subnet_names = ["${local.name}-public-${var.region}-01", "${local.name}-public-${var.region}-02", "${local.name}-public-${var.region}-03"]

  create_database_subnet_group = false

  manage_default_network_acl = false
  default_network_acl_tags   = { Name = "${local.name}-ACL" }

  manage_default_route_table = false
  default_route_table_tags   = { Name = "${local.name}-Route" }

  manage_default_security_group = false
  default_security_group_tags   = { Name = "${local.name}-ASG" }

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true

  # customer_gateways = {
  #   IP1 = {
  #     bgp_asn     = 65112
  #     ip_address  = "1.2.3.4"
  #     device_name = "some_name"
  #   },
  #   IP2 = {
  #     bgp_asn    = 65112
  #     ip_address = "5.6.7.8"
  #   }
  # }

  enable_vpn_gateway = false

  enable_dhcp_options = true
  # dhcp_options_domain_name         = "service.consul"
  # dhcp_options_domain_name_servers = ["127.0.0.1", "10.10.0.2"]

  # VPC Flow Logs (Cloudwatch log group and IAM role will be created)
  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true
  flow_log_max_aggregation_interval    = 60

  tags = local.tags

}

################################################################################
# VPC Endpoints Module
################################################################################

module "vpc_endpoints" {
  source = "../vpc-endpoints"

  vpc_id             = module.vpc.vpc_id
  security_group_ids = [data.aws_security_group.default.id]

  endpoints = {
    # s3 = {
    #   service = "s3"
    #   name    = ""
    #   tags    = { Name = "s3-vpc-endpoint" }
    # },
    # dynamodb = {
    #   service         = "dynamodb"
    #   service_type    = "Gateway"
    #   route_table_ids = flatten([module.vpc.intra_route_table_ids, module.vpc.private_route_table_ids, module.vpc.public_route_table_ids])
    #   policy          = data.aws_iam_policy_document.dynamodb_endpoint_policy.json
    #   tags            = { Name = "dynamodb-vpc-endpoint" }
    # },
    # server1 = {
    #   service             = "ec2"
    #   private_dns_enabled = true
    #   subnet_ids          =  flatten([module.vpc.private_subnets])
    #   security_group_ids  = [aws_security_group.vpc_global_asg.id]
    #   tags                = { Name = "${local.name}-${var.region}-ec2" }
    # },
    # server2 = {
    #   service             = "ec2"
    #   private_dns_enabled = false
    #   subnet_ids          =  flatten([module.vpc.public_subnets[0]])
    #   security_group_ids  = [aws_security_group.vpc_global_asg.id]
    #   tags                = { Name = "${local.name}-${var.region}-server" }
    # },

  }
  tags = merge(local.tags, {
    Endpoint = true
  })
}

module "vpc_endpoints_nocreate" {
  source = "../vpc-endpoints"
  create = false
}

################################################################################
# Data Query Supporting Resources
################################################################################

# Available region zones
data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name   = "zone-type"
    values = ["availability-zone"]
  }
}

# Default AWS Security Group
data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}

# Dynamo Policy
data "aws_iam_policy_document" "dynamodb_endpoint_policy" {
  statement {
    effect    = "Deny"
    actions   = ["dynamodb:*"]
    resources = ["*"]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    condition {
      test     = "StringNotEquals"
      variable = "aws:sourceVpce"

      values = [module.vpc.vpc_id]
    }
  }
}

# IAM Policy
data "aws_iam_policy_document" "generic_endpoint_policy" {
  statement {
    effect    = "Deny"
    actions   = ["*"]
    resources = ["*"]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    condition {
      test     = "StringNotEquals"
      variable = "aws:SourceVpc"

      values = [module.vpc.vpc_id]
    }
  }
}

################################################################################
# Security Group Module
################################################################################

resource "aws_security_group" "vpc_global_asg" {
  name_prefix = "${local.name}-vpc-global-asg"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  tags = local.tags
}

################################################################################
# Elastic IP addresses
################################################################################
resource "aws_eip" "nat" {
  count = 1
  vpc   = true
  tags  = local.tags
}
