################################################################################
# VPC variables declaration
################################################################################

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "vpc_CIDR" {
  description = "Set the IP subnet configuration to be configured into VPC for all required network resources."
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_private_subnet_cidr_blocks" {
  description = "Available 3 cidr blocks (max) for private subnets with 256 IPs each."
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
  ]
}

variable "vpc_public_subnet_cidr_blocks" {
  description = "Available 3 cidr blocks (max) for public subnets with 256 IPs each."
  type        = list(string)
  default = [
    "10.0.11.0/24",
    "10.0.12.0/24",
    "10.0.13.0/24",
  ]
}

variable "resource_Tags" {
  description = "Dedicated tags to be set in resources of the module"
  type        = map(string)
  default = {
    Project     = "TBD"
    Environment = "TBD"
    Department  = "TBD"
    Cost_Centre = "TBD"
    Author      = "Marcelo Lavor"
    Email       = "marcelo.lavor@gmail.com"
    GithubRepo  = "TBD"
    GithubOrg   = "TBD"
  }
}


################################################################################
# Development variables declaration
################################################################################

variable "Network_CIDR" {
  description = "Set the IP address configuration to be configured into VPC and all required network resources."
  type        = list(string)
  nullable    = false
}

variable "N_Subnets" {
  description = "Set the total subnets to create into VPC. This input variable can only accept an even number, except if the 'plus' of this module (see below) is done, then this condition does not apply."
  type        = number
  nullable    = false
}

variable "Name" {
  description = "To set the name value concatenated on Tags or resources field if the resource support or require it."
  type        = string
  nullable    = false
}

variable "Tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  nullable    = false
}
