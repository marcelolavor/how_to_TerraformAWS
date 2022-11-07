variable "server_instance_type" {
  description = "AWS ec2 instance type"
  default     = "t2.micro"
}

variable "server_ami" {
  description = "amazon machine image"
  default     = "ami-0f540e9f488cfa27d"
}

variable "server_ssh_port" {
  description = "SSH service port"
  default     = "22"
}

variable "server_tls_port" {
  description = "HTTPs service port"
  default     = "443"
}

variable "server_port" {
  description = "HTTP service port"
  default     = "80"
}