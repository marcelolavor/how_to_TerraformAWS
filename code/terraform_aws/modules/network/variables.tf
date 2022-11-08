variable "Network_CIDR" {
  description = "Set the IP address configuration to be configured into VPC and all required network resources."
  type        = list(string)
  nullable    = false
}

variable "N_Subnets" {
  description = "Set the total subnets to create into VPC. This input variable can only accept an even number, except if the 'plus' of this module (see below) is done, then this condition does not apply."
  type        = number
  nullable    = false
  default = 0
}

variable "Name" {
  description = "To set the name value concatenated on Tags or resources field if the resource support or require it."
  type        = string
  nullable    = false
}

variable "Tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  nullable    = true
  default ={}
}


# --------------------------------------------------------------------------------------

variable vpcs {
  type = map
  default = {
    "tf" = {
      "cidr" = vpc.cidr
      "tags" = var.tags
    }
  }
}

variable subnets {
  type = map
  default = merge{vpc.private_subnets, vpc.public_subnets}
}

locals {
  vpc_subnet_var = flatten([
    for v in keys(var.vpcs) : [
      for s in keys(var.subnets) : {
        network_name   = v
        tags           = var.vpcs[v]["tags"]
        subnet_name    = format("%v_%s", v, s)
        subnet_cidr    = cidrsubnet(var.vpcs[v]["cidr"], 8, var.subnets[s]["subnet"])
        subnet_az      = element(local.my_azs, var.subnets[s]["subnet"] % 2)
        subnet_rttable = var.subnets[s]["rttable"]
      }
    ]
  ])
  prefix = "${var.prefix}-${terraform.workspace}-tf"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    ManagedBy   = "Terraform"
  }
  my_azs = slice(data.aws_availability_zones.azs.names, 0, 2)
}