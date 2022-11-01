# Instances Module

## Module description
Build a golden image manifest by Hashicorp Packer to be used by Terraform for instances creation on the private subnets.

## Input variables
- Network (module.Network.output.Network, required)
- Image (module.Golden_Image.output.Manifest, required)
- Name (string, required)
- Tags (key/value dictionary or map, optional)

## Output variables
- Private_Instances_IP_addresses (key/value dictionary or map)
- Bastion_Host_IP_address (string)
- Load_balancer_HTTP_DNS (string)
- SSH_key_Content (string)
- Usernames (key/value dictionary or map or string)