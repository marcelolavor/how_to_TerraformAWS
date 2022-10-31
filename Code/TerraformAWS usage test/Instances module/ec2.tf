resource "aws_instance" "t2.micro" {

 ami = "ami-0a313d6098716f372" 
 instance_type = "t2.micro"
 vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]
 key_name = "terraform_test"
 tags = {
	 Name = "First VM test"
 }

}
