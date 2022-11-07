resource "aws_launch_configuration" "server_launch_config" {
  image_id        = var.server_ami
  instance_type   = var.server_instance_type
  security_groups = ["${aws_security_group.server_asg.id}"]
  key_name        = "terraform_key"
  user_data       = file("${path.module}/server_script.sh")

  lifecycle {
    create_before_destroy = true
  }
}
