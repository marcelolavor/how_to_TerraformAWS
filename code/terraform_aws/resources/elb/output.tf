output "Load_blanacer_public_dns_name" {
  description = "Public DNS name to reach the created HTTP publication."
  value = [ "${aws_elb.terraform_elb.dns_name}"]
}
