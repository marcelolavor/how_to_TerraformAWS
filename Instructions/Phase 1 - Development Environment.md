# Phase 1 - Development Environment

## Step 01 - Development environment setup

### Assumptions
- Linux OS will be here defined as the best fit for development environment setup to avoid lack compatibiliy some local open sources lab in Windows environment
- As a matter of test, this development environment is built on top of an Ubuntu 22.04 standard docker image very light
- It is here considered that there is previously available a computer with a docker application installed and a dockerhub account created to push final docker image
- The docker environment access is granted as root by interactive mode (no 'sudo su -' demanded for terraform deployment)

### Docker image acquisition

1. Pull a light standard Ubuntu's 22.04 image 

    > docker pull ubuntu

2. Run the docker image in interative mode

    > docker run -it --name "TerraformAWS" ubuntu bash

### Docker environment setup

1. Prepare the basic Ubuntu distribution for applications deployment

    **Update and upgrade linux distro**
    
    > apt update && apt upgrade

    **Install some tools on top of this very light standard container to allow all further required deployments**
    
    > apt install gpg docker sudo vim lsb-release git curl unzip python3 python3.10-venv groff
    
    **Setup Hashicorp repository**
    
    > wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg<BR>
    > echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

2. Install terraform application 

    **Update linux distro and install Terraform application**
    > apt update && apt install terraform

## Step 02 - Environment initial configutarion

    **Install tfenv to deal with further Terraform new release smoothly**
    > git clone --depth=1 https://github.com/tfutils/tfenv.git ~/utils/.tfenv
    > echo 'export PATH="$HOME/utils/.tfenv/bin:$PATH"' >> ~/.bash_profile
    > source ~ / .bash_profile

## Step 03 - Basics tests and phase approval

    **List remote repo, deploy latest(again) and check release against remote repository
    > terraform -v

    > tfenv list-remote | head -2
    > tfenv install latest
    > tfenv list

    ** Select and confirm terraform deployed release**
    > tfenv use latest
    > terraform -v
  

#### Useful reference links
- Terraform - https://www.terraform.io/downloads
- tfenv - https://github.com/tfutils/tfenv
- tfvar - https://github.com/shihanng/tfvar
- Git - https://git-scm.com/downloads
- VSC - https://code.visualstudio.com/download
