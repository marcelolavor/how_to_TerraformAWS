resource "aws_security_group_rule" "allow_ssh" {
  type = "ingress"
  security_group_id=["aws_security_group.tf_asg_server.id","aws_security_group.tf_asg_webservers_web_secure.id","aws_security_group.tf_asg_webservers_web_simple.id"]
  from_port   = var.server_ssh_port
  to_port     = var.server_ssh_port
  protocol    = "tcp"
  cidr_blocks = [var.Network_CIDR]
}

resource "aws_security_group_rule" "allow_https" {
  type = "ingress"
  security_group_id=[
    "aws_security_group.tf_asg_webservers_web_secure.id"
    ]
  from_port   = var.server_tls_port
  to_port     = var.server_tls_port
  protocol    = "tcp"
  cidr_blocks = [var.Network_CIDR]
}

resource "aws_security_group_rule" "allow_http" {
  type = "ingress"
  security_group_id=[
    "aws_security_group.tf_asg_webservers_web_simple.id"
    ]
  from_port   = var.server_port
  to_port     = var.server_port
  protocol    = "tcp"
  cidr_blocks = [var.Network_CIDR]
}

resource "aws_security_group_rule" "LB_rule" {
  type = "ingress"
  security_group_id=[
    "aws_security_group.tf_asg_webservers_web_simple.id"
    ]
  from_port   = var.server_port
  to_port     = var.server_port
  protocol    = "tcp"
  cidr_blocks = [var.Network_CIDR]
}

resource "aws_security_group_rule" "allow_outgoing" {
  type = "egress"
  security_group_id=[
    "aws_security_group.tf_asg_server.id",
    "aws_security_group.tf_asg_webservers.id",
    "aws_security_group.tf_asg_secure_webservers.id"
    ]
  from_port   = 0
  to_port     = 0
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}