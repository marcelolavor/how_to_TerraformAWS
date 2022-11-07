/*
resource "aws_instance" "pvt_ec2" {

 ami = var.server_ami
 instance_type = var.server_instance_type
 vpc_security_group_ids = ["${aws_security_group.terraform_pub_sg.id}"]
 tags = {
	 Name = "pvt_ec2_name_${count.index}"
 }
 key_name = "terraform_key"
 count = var.server_instance_count
 user_data = <<-EOF
	#!/bin/bash
        exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
        /usr/bin/apt-get update
        DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get upgrade -yq
        /usr/bin/apt-get install apache2 -y
        /usr/sbin/ufw allow in "Apache Full"
        private_instance_name = `echo "Welcome to private_instance_name<br>"`
        instance_ip=`curl http://169.254.169.254/latest/meta-data/public-ipv4`
        /bin/echo "<h1>Hello world!</h1>" >/var/www/html/index.html
        /bin/echo $private_instance_name >>/var/www/html/index.html
        /bin/echo $instance_ip >>/var/www/html/index.html
	EOF
}
*/