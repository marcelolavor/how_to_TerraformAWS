output "public_ip" {
    value = [ "${aws_instance.pvt_ec2.public_ip}" ]
}
