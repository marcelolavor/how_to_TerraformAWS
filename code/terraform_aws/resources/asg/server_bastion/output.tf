output "endpoint" {
  value = ""
}

output "asg_id" {
  value = aws_security_group.server_asg.id
}
