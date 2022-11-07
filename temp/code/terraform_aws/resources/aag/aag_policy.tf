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