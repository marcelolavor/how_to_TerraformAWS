# Phase 1 - Development Environment

## Step 01 - Development environment setup

### Assumptions
- Linux OS will be here defined as the best fit for development environment setup to avoid lack compatibiliy some local open sources projects in Windows environment
- As a matter of test, this challenge will create the development environment on top of a Ubuntu 22.04 standard docker image 
- It is here considered that there is previously available a computer with a docker application installed and a dockerhub account created for final docker push step 
- The docker environment access is granted as root in interactive mode (no 'sudo su -' demanded for terraform deployment)

### Docker image acquisition

1. Pull a light standard Ubuntu's 22.04 image 

    > docker pull ubuntu

2. Run the docker image in interative mode

    > docker run -it --name "TerraformAWS" ubuntu bash

### Docker environment setup

1. Prepare the basic Ubuntu distribution for applications deployment

    **Update and upgrade linux distro**
    
    > apt update && apt upgrade

    **Install pre-requisites for hashicorp repository setup needs**
    
    > apt install gpg docker sudo vi lsb-release
    
    **Setup Hashicorp repository**
    
    > wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg<BR>
    > echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

2. Install terraform application 

    **Update linux distro and install Terraform application**
    > apt update && apt install terraform

    **Install terraenv to deal with different terraform releases in case of need
    > 

## Step 02 - Environment initial configutarion


## Step 03 - Basics tests and phase approval

  

#### Useful reference links
- Git - https://git-scm.com/downloads
- VSC - https://code.visualstudio.com/download
- Terraform - https://www.terraform.io/downloads
- Terraform Env - https://github.com/aaratn/terraenv
