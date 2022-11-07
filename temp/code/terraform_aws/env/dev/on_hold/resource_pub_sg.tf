resource "aws_security_group" "terraform_pub_sg" { 

    ingress {
        from_port = var.server_port
        to_port = var.server_port
        protocol = "tcp"
        cidr_blocks = [ var.internet_allowed_IP ]
    }

    ingress {
        from_port = var.server_ssh_port
        to_port = var.server_ssh_port
        protocol = "tcp"
        cidr_blocks = [ var.internet_allowed_IP ]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
	    Name = "public_sg_name"
    }
}
