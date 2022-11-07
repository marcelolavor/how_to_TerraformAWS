# Golden Image Module

## Module description
Build a golden image manifest by Hashicorp Packer to be used by Terraform for instances creation on the private subnets.


## Packer input/output

### Input variables
- Name (string,required)

### Output variables
- Manifest_path (string, required).


## Terraform input/output

### Input variables
- Manifest_path (string, required).

### Output variables
- Manifest (Key/value dictionary or map)