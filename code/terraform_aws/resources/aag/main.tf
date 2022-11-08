################################################################################
# Local variables declaration
################################################################################
locals {
  # Concatenate variable Name and module name
  name = "${var.Name}-${replace(basename(path.cwd), "_", "-")}"

  tags = merge(var.resource_Tags, var.Tags, {
    Type ="VMs"
    Name = "aag_01"
    propagate_at_launch = true
    })
}

resource "aws_autoscaling_group" "server_aag" {
  launch_configuration = aws_launch_configuration.server_launch_config.id
  availability_zones   = var.aws_azs

  min_size         = var.server_min_scale
  max_size         = var.server_max_scale
  desired_capacity = var.server_desired_scale

  # tags = [local.tags, {
  #   Type ="VMs"
  #   Name = "aag_01"
  #   propagate_at_launch = true
    # }]
}

resource "aws_launch_configuration" "server_launch_config" {
  image_id        = var.server_ami
  instance_type   = var.server_instance_type
  security_groups = [var.Network.security_group_id]
  key_name        = "terraform_key"
  user_data       = file("${path.module}/server_script.sh")

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "server_aag_policy" {
  name                   = "AWS Autoscalling Policy for server"
  autoscaling_group_name = aws_autoscaling_group.server_aag.name
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = "60"
  }
}
