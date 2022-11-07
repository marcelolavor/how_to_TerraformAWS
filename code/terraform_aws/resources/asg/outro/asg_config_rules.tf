resource "aws_security_group_rule" "server_web_simple_allow_ssh" {
  type = "ingress"
  security_group_id = "aws_security_group.server_web_simple_asg.id"
  from_port   = var.server_ssh_port
  to_port     = var.server_ssh_port
  protocol    = "tcp"
  cidr_blocks = [var.Network_CIDR]
}

resource "aws_security_group_rule" "server_web_simple_allow_http" {
  type = "ingress"
  security_group_id = "aws_security_group.server_web_simple_asg.id"
  from_port   = var.server_port
  to_port     = var.server_port
  protocol    = "tcp"
  cidr_blocks = [var.Network_CIDR]
}

resource "aws_security_group_rule" "server_web_simple_allow_outgoing" {
  type = "egress"
  security_group_id = "aws_security_group.server_web_simple_asg.id"
  from_port   = 0
  to_port     = 0
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}