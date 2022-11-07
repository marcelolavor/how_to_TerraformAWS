# SERVER VARIABLES

variable "Name" {
  description = "To set the name value concatenated on Tags or resources field if the resource support or require it."
  type        = string
  nullable    = false
}

variable "Image" {
  description = "Golden Image to be used on the attached Instances on private subnets"
  type        = string
  nullable    = true
}

variable "Network" {
  description = "Array containing the full resource object and attributes for all endpoints created into the VPC"
  type        = map(string)
  nullable    = true
}

variable "Tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  nullable    = true
}


