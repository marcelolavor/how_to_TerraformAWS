# output "endpoint" {
#   value = ""
# }

# output "asg_id" {
#   value = aws_security_group.server_asg.id
# }

output "Network" {
  value = merge(var.Network, {
    "security_group_id" = aws_security_group.server_asg.id
  })
}