output "Load_blanacer_HTTP_Content" {
  description = "Public DNS name to reach the created HTTP publication."
  value = [ "${aws_elb.terraform_elb.dns_name}"]
}

output "Usernames" {
    value = [ "ubuntu"]
}

