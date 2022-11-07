################################################################################
# Local variables declaration
################################################################################
locals {
  # Concatenate variable Name and module name
  name = "${var.Name}-${replace(basename(path.cwd), "_", "-")}"

  tags = merge(var.resource_Tags, var.Tags)
}

module "webserver_asg" {
  source = "../server"

  description = "AWS Security Group to the WEb servers"

  Name         = var.Name
  Network_CIDR = var.Network["public_subnets_cidr_blocks"]
  Image        = var.Image
  Tags         = local.tags

}

resource "aws_security_group_rule" "webserver_asg_rule_allow_http" {
  description       = "HTTP connection to the web servers"
  type              = "ingress"
  security_group_id = aws_security_group.webserver_asg.id
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [var.Network_CIDR]
}
