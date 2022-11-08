################################################################################
# AAG Launch variables declaration
################################################################################
variable "server_instance_type" {
  description = "AWS ec2 instance type"
  default     = "t2.micro"

  validation {
   condition     = can(regex("^[Tt][2-3].(nano|micro|small)", var.server_instance_type))
   error_message = "Invalid Instance Type name. You can only choose - t2.nano,t2.micro,t2.small"
 }  
}

variable "server_ami" {
  description = "amazon machine image"
  default     = "ami-0f540e9f488cfa27d"
}

variable "server_ssh_port" {
	description = "ssh port connection to the server"
  type        = number
	default     = 22
}

variable "server_tls_port" {
  description = "HTTPs service port"
  default     = "443"
}

variable "server_port" {
  description = "HTTP service port"
  default     = "80"
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
# AAG Launch variables declaration
################################################################################
variable "server_min_scale" {
  description = "AWS ec2 minimal scale instances(qtd)"
  default     = 1
}

variable "server_max_scale" {
  description = "AWS ec2 maximal scale instances(qtd)"
  default     = 3
}

variable "server_desired_scale" {
  description = "AWS ec2 desired scale instances(qtd)"
  default     = 3
}

variable "aws_azs" {
  default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

################################################################################
# Development variables declaration
################################################################################

variable "Name" {
  description = "To set the name value concatenated on Tags or resources field if the resource support or require it."
  type        = string
  nullable    = false
}

variable "Network" {
  description = "Set the source network CIDR addressed to access the resources."
  type        = map(string)
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
  default = {}
}
