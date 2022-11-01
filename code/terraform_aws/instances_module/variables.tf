variable "aws_region" {
	description = "AWS region"
	default = "eu-west-2"
}

variable "server_port" {
	description = "http service port"
	default = "80"
}

variable "server_ssh_port" {
	description = "ssh port connection to the server"
	default = "22"
}

variable "server_instance_type" { 
	description = "AWS ec2 instance type"
	default="t2.micro"
}

variable "server_ami" {
    description = "amazon machine image"
    default = "ami-0f540e9f488cfa27d"
}

variable "internet_allowed_IP" {
	description = "Allowed external IP addresses to consume the offered service" 
    default = "85.242.34.25/32"
}