################################################################################
# Terraform AWS project
################################################################################
module "network" {
  source = "./modules/network"

  Name         = var.Name
  Network_CIDR = var.Network_CIDR
  N_Subnets    = var.N_Subnets
  Tags         = var.Tags

}

# module "golden_img" {
#   source = "./modules/golden_img"

#   Name    = var.Name
#   Image   = "minha_imagem"
#   Network = module.network.Network
#   Tags    = var.Tags
# }

# module "instances" {
#   source = "./modules/instances"

#   Name    = var.Name
#   Network = module.network.Network
#   Image   = "" #module.golden_img.outputs.Image
#   Tags = merge(var.Tags, {
#     Type = "VMs"
#   })
# }