variable "Name" {
	description = "To set the name value concatenated on Tags or resources field if the resource support or require it." 
    default = "test"
}

variable "Network_CIDR" {
	description = "Set the IP address configuration to be configured into VPC and all required network resources." 
    default = "85.242.34.25/32"
}

variable "aws_region" {
	description = "AWS region"
	type        = string
	default = "eu-west-2"
}

variable "N_Subnets" {
	description = "Set the total subnets to create into VPC. This input variable can only accept an even number, except if the 'plus' of this module (see below) is done, then this condition does not apply."
    default = 6
}

variable "vpc_public_subnet_count" {
  description = "Number of public subnets."
  type        = number
  default     = 3
}

variable "vpc_public_subnet_cidr_blocks" {
  description = "Available cidr blocks for public subnets with 256 IPs each."
  type        = list(string)
  default     = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.7.0/24",
    "10.0.8.0/24",
  ]
}

variable "vpc_private_subnet_count" {
  description = "Number of private subnets."
  type        = number
  default     = 3
}

variable "vpc_private_subnet_cidr_blocks" {
  description = "Available cidr blocks for private subnets with 256 IPs each."
  type        = list(string)
  default     = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24",
    "10.0.105.0/24",
    "10.0.106.0/24",
    "10.0.107.0/24",
    "10.0.108.0/24",
  ]
}

variable "server_instance_type" { 
	description = "AWS ec2 instance type"
	default="t2.micro"
}

variable "server_ami" {
    description = "amazon machine image"
    default = "ami-0f540e9f488cfa27d"
}

variable "server_min_scale" {
	description = "AWS ec2 minimal scale instances(qtd)"
	default = 1
}

variable "server_max_scale" {
	description = "AWS ec2 maximal scale instances(qtd)"
	default = 2
}

variable "server_desired_scale" {
	description = "AWS ec2 desired scale instances(qtd)"
	default = 1
}

variable "server_port" {
	description = "http service port"
	default = "80"
}

variable "server_ssh_port" {
	description = "ssh port connection to the server"
	default = "22"
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {
    project     = "project Test",
    environment = "dev",
    author      = "Marcelo Lavor"
    email       = "marcelo.lavor@gmail.com"
  }
}