################################################################################
# Local variables declaration
################################################################################
locals {
  # Concatenate variable Name and module name
  name = "${var.Name}-${replace(basename(path.cwd), "_", "-")}"

  tags = merge(var.resource_Tags, var.Tags)

}

resource "aws_security_group" "server_asg" {
  description = "AWS Security Group to the servers"
  vpc_id = var.Network.vpc_id
  tags = local.tags
}

resource "aws_security_group_rule" "server_asg_rule_allow_ssh" {
  description       = "SSH connection to the servers"
  type              = "ingress"
  security_group_id = aws_security_group.server_asg.id
  from_port         = var.server_ssh_port
  to_port           = var.server_ssh_port
  protocol          = "tcp"
  cidr_blocks       = [var.Network.Network_CIDR]
}

resource "aws_security_group_rule" "server_asg_rule_allow_outgoing" {
  description       = "SSH connection to the servers"
  type              = "egress"
  security_group_id = aws_security_group.server_asg.id
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}