# All information regarding the VPC,subnets and any existing settings and resources related to the creation and configuration of networking in this module.
output "Network" {
  description = "Array containing the full resource object and attributes for all endpoints created into the VPC"
  value = tomap({
    Network_CIDR                        = var.Network_CIDR[0]
    vpc_id                              = module.vpc.vpc_id
  })
}

# # All information regarding the VPC,subnets and any existing settings and resources related to the creation and configuration of networking in this module.
# output "Network" {
#   description = "Array containing the full resource object and attributes for all endpoints created into the VPC"
#   value = {
#     Network_CIDR                        = var.Network_CIDR
#     vpc_id                              = module.vpc.vpc_id
#     vpc_arn                             = module.vpc.vpc_arn
#     vpc_owner_id                        = module.vpc.vpc_owner_id
#     vpc_endpoints                       = module.vpc.vpc_endpoints
#     vpc_cidr_block                      = module.vpc.vpc_cidr_block
#     vpc_secondary_cidr_blocks           = module.vpc.vpc_secondary_cidr_blocks
#     nat_ids                             = module.vpc.nat_ids
#     nat_public_ips                      = module.vpc.nat_public_ips
#     private_subnet_arns                 = module.vpc.private_subnet_arns
#     private_subnets                     = module.vpc.private_subnets
#     private_subnets_cidr_blocks         = module.vpc.private_subnets_cidr_blocks
#     private_route_table_ids             = module.vpc.private_route_table_ids
#     private_route_table_association_ids = module.vpc.private_route_table_association_ids
#     igw_arn                             = module.vpc.igw_arn
#     igw_id                              = module.vpc.igw_id
#     public_subnet_arns                  = module.vpc.public_subnet_arns
#     public_subnets                      = module.vpc.public_subnets
#     public_subnets_cidr_blocks          = module.vpc.public_subnets_cidr_blocks
#     public_route_table_ids              = module.vpc.public_route_table_ids
#     public_route_table_association_ids  = module.vpc.public_route_table_association_ids
#   }
# }