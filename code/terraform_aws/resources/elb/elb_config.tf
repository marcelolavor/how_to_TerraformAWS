resource "aws_elb" "terraform_elb" {
  name               = "terraform-elb"
  availability_zones = var.aws_azs
  security_groups    = [aws_security_group.terraform_elb_sg.id]
  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = var.server_port
    instance_protocol = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:${var.server_port}/index.html"
  }
}


