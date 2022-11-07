/*
# MODULE INSTANCES
# Author:   Marcelo Lavor
*/

/*
# INPUT VARIABLES
- Network (module.Network.output.Network, required) to set where Instances must be attached.
- Image (module.Golden_Image.output.Manifest, required) to set the Golden Image to be used on the attached Instances on private subnets (not for bastion host)
- Name (string, required) To set the name value on Tags or resources field if the resource support or require it (Caution! sometimes the name fields existing in some resources must be unique regarding other resources, thus, it must be handled)
- Tags (key/value dictionary or map, optional) Set a defined tags on the resources that support it.
*/

################################################################################
# Instances module
################################################################################

module "asg-server" {
  source = "../../resources/asg/server"

  Name         = var.Name
  Network_CIDR = var.Network_CIDR
  Image        = var.Image
  Tags         = var.Tags
}

# module "ec2-instances" {
#   source = "../../resources/ec2"

#   Name         = var.Name
#   Network      = var.Network
#   Image         = var.Image
#   Tags         = var.Tags

# }

# module "ec2-server" {
#   source = "../../resources/ec2"

#   Name         = var.Name
#   Network      = var.Network
#   Image         = var.Image
#   Tags         = var.Tags

# }

# module "elb" {
#   source = "../../resources/elb"

#   Name         = var.Name
#   Network      = var.Network
#   Image         = var.Image
#   Tags         = var.Tags

# }

# module "aws_web_server_instance" {
#   source            = "./modules/aws-web-server-instance"
#   ec2_instance_type = var.ec2_instance_type
#   vpc_id            = module.aws_web_server_vpc.vpc_id
#   subnet_id         = module.aws_web_server_vpc.subnet_id
# }

/*
# OUTPUT VARIABLES
- Private_Instances_IP_addresses (key/value dictionary or map). List of private IP addresses of the attached instances on private subnet.
- Bastion_Host_IP_address (string). Public IP of bastion host to jump to rest of private Instances.
- Load_balancer_HTTP_DNS (string). Public DNS name to reach the created HTTP publication.
- SSH_key_Content (string). The SSH key to connect all instances (even the bastion host).
- Usernames (key/value dictionary or map or string). The usernames to connect the instances (even bastion host). If the username is the same for all instances (even bastion host) then a simple string output variable is enough
*/

/*
# EXPECTED BEHAVIOUR
1. Ingest all input variables
2. Create an Instance T2.micro per private subnet set in Network variable of this module based on the golden image module
3. Create a bastion T2.micro host using a GNU/Linux image free of license and open source from AWS Marketplace.
4. Create an application load balancer attached to all public subnets and listening for 80/TCP to the private instances.
5. Create the SSH key pairs to connect all instances and bastion host
6. Create the proper Security Groups to grant the following accesses

    # SSH ACCESS
    Public IP (code run) --> 22/TCP of the bastion host
    Bastion Host --> 22/TCP of the private Instances
    
    # HTTP SERVICE
    Any host --> 80/TCP of the Application Load Balancer
    Application Load Balancer --> 80/TCP of the private instances

    #
    Any host --> ICMP service at any host

7. Expose all output variables
*/
