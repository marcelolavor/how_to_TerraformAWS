/*
output "public_ip" {
    value = [ "${aws_instance.pvt_ec2.*.public_ip}" ]
}
*/
output "asg_arn" {
    value = [ "${aws_autoscaling_group.terraform_asg.arn}"]
}

/*
output "Private_instances_IP_addresses" {
    value = [ "${aws_instance.pvt_ec2.*.private_ip}" ]
}
*/

/*
output "Server_Host_IP" {
    value = [ "${aws_instance.pvt_ec2.*.private_ip}" ]
}
*/

/*
output "SSH_key_content" {
    value = [ "${aws_instance.pvt_ec2.*.private_ip}" ]
}
*/

output "Load_blanacer_HTTP_Content" {
  description = "Public DNS name to reach the created HTTP publication."
  value = [ "${aws_elb.terraform_elb.dns_name}"]
}

output "Usernames" {
    value = [ "ubuntu"]
}

