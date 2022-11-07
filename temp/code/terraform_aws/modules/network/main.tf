################################################################################
# Network module creation
################################################################################
module "vpc" {
  source = "../../resources/vpc"

  Name         = var.Name
  Network_CIDR = var.Network_CIDR
  N_Subnets    = var.N_Subnets
  Tags         = var.Tags

}
