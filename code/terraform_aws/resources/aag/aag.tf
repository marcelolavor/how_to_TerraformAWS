resource "aws_autoscaling_group" "server_bastion_aag" {
  launch_configuration = aws_launch_configuration.server_bastion_launch_config.id
  availability_zones   = var.aws_azs

  min_size         = var.server_min_scale
  max_size         = var.server_max_scale
  desired_capacity = var.server_desired_scale

  tag {
    key                 = "Name"
    value               = "asg_01"
    propagate_at_launch = true
  }
}
