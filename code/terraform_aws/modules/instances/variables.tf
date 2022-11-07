# # SERVER VARIABLES

# variable "server_ami" {
#   description = "AMI definition (Amazon Machine Image)"
#   default     = data.aws_ami.amazon_linux.id     # "ami-0f540e9f488cfa27d"
# }

# variable "server_instance_type" {
#   description = "AWS ec2 instance type"
#   default     = "t2.micro"
# }

variable "Name" {
  description = "To set the name value concatenated on Tags or resources field if the resource support or require it."
  type        = string
  nullable    = false
}

variable "Network" {
  description = "Array containing the full resource object and attributes for all endpoints created into the VPC"
  type        = map(string)
  nullable    = true
}

variable "Image" {
  description = "Golden Image to be used on the attached Instances on private subnets"
  type        = map(string)
  nullable    = true
}

variable "Tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  nullable    = true
}


