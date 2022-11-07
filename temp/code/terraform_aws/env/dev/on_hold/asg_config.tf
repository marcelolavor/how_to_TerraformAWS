resource "aws_autoscaling_group" "terraform_asg" {
  launch_configuration = aws_launch_configuration.terraform_launch_conf.id
  min_size             = 1
  max_size             = 3
  desired_capacity     = 3
  load_balancers       = [aws_elb.terraform_elb.name]
  availability_zones   = var.aws_azs

}
