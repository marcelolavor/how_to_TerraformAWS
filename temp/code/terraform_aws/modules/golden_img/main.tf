/*
# MODULE Golden Image
# Author:   Marcelo Lavor
*/

/*
# INPUT VARIABLES
- 
*/

module "asg-golden-img" {
  source = "../../resources/asg/server"

  Name         = var.Name
  Network_CIDR = var.Network["public_subnets_cidr_blocks"]
  Image        = var.Image
  Tags         = var.Tags
}