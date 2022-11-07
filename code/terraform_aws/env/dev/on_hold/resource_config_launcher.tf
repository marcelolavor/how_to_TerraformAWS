resource aws_launch_configuration "terraform_launch_config" {
name = "pvt_ec2_launch_config"
image_id = var.server_ami
instance_type = var.server_instance_type
security_groups=["${aws_security_group.terraform_pub_sg.id}"]
key_name = "terraform_key"
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
