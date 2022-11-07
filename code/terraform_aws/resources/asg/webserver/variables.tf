################################################################################
# ASG variables declaration
################################################################################
variable "resource_Tags" {
  description = "Dedicated tags to be set in the resources"
  type        = map(string)
  default = {}
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
