resource "aws_autoscaling_policy" "server_web_simple_aag_policy" {
  name = "AWS Autoscalling Group Policy for web servers "
  policy_type = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.server_web_simple_aag.name

  target_tracking_configuration {
  predefined_metric_specification {
    predefined_metric_type = "ASGAverageCPUUtilization"
  }
  target_value = "60"
  }

}
