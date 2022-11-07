
variable "server_instance_type" {
  description = "AWS ec2 instance type"
  default     = "t2.micro"
}

variable "server_ami" {
  description = "amazon machine image"
  default     = "ami-0f540e9f488cfa27d"
}

variable "aws_azs" {
  default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "Network_CIDR" {
  description = "Set the IP address configuration to be configured into VPC and all required network resources."
  type        = string
  default     = "85.242.34.25/32"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "N_Subnets" {
  description = "Set the total subnets to create into VPC. This input variable can only accept an even number, except if the 'plus' of this module (see below) is done, then this condition does not apply."
  type        = number
  default     = 6
}

variable "Name" {
  description = "To set the name value concatenated on Tags or resources field if the resource support or require it."
  type        = string
  default     = "test"
}

variable global_tags {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    Project     = "project"
    Environment = "dev"
    Department  = "TBD"
    Cost_Centre = "TBD"
    Author      = ""
    Email       = ""
  }
}

variable extra_tags {
  description = "Additional tags"
  type        = map(string)
  default = {
   Name = "terraform-asg-var.global_tags[environment]-count.index"
   propagate_at_launch = true
  }
}

variable "Network_ELB" {
  description = "Source IP address from Elastic LoadBalance network."
  type        = string
  default     = ""
}
