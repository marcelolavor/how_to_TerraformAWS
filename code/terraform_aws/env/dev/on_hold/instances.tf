resource "aws_instance" "terraform_ec2" {

  ami           = var.server_ami
  instance_type = var.server_instance_type
  key_name      = "terraform_key"
  tags = {
    Name = var.Name
  }

}
 