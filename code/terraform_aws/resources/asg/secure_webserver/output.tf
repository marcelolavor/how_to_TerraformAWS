output "endpoint" {
  value = ""
}

output "asg_id" {
  value = aws_security_group.secure_webserver_asg.id
}
