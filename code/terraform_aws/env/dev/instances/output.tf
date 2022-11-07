output "pub_ip" {
    value = "module.my_ec2.public_ip"
}

output "pub_dns" {
    value = "module.my_ec2.public_dns"
}

output "pvt_ip" {
    value = "module.my_ec2.private_ip"
}

output "pvt_dns" {
    value = "module.my_ec2.private_dns"
}