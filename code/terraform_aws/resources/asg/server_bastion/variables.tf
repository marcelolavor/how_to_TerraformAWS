################################################################################
# ASG variables declaration
################################################################################
variable "server_ssh_port" {
	description = "ssh port connection to the server"
  type        = number
	default     = 22
}

variable "resource_Tags" {
  description = "Dedicated tags to be set in the resources"
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

variable "Name" {
  description = "To set the name value concatenated on Tags or resources field if the resource support or require it."
  type        = string
  nullable    = false
}

variable "Network_CIDR" {
  description = "Set the source network CIDR addressed to access the resources."
  type        = string
  nullable    = false
}

variable "Image" {
  description = "Golden Image to be used on the attached Instances on private subnets"
  type        = string
  nullable    = false
}

variable "Tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  nullable    = false
}
