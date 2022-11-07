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
  nullable    = true
}
