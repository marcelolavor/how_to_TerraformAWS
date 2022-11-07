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
