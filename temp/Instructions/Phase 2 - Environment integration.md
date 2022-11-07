# Phase 2 - Environment integration

### Assumptions
- AWS cloud basic knowledge
- MFA basic knowledge
- Use of VSC - Visual Studio Code as IDE for code development 

## Step 04 - Account creation at AWS Cloud

1. Create free account at aws.amazon.com
2. Go to IAM and set MFA to your root AWS account
3. Set an account alias, as for example "[YOUR_NAME]-terraformaws"
4. Create an admin user ("terraform") for Terraform deployments
5. Grant access "AdministratorAccess"
6. Take note about the AWS Sign-in URL to facilitate the next step


## Step 05 - Basic cloud config

1. Go to the AWS Sign-in URL: https://[yourURL].signin.aws.amazon.com/console
2. Log in with your previouly defined admin user
3. Go to IAM and also turn on MFA to this admin user 
4. Create an "AWS Access Key" to be used by AWSCLI from the local docker container lab
5. Take note about "AWS Access key ID" and "AWS Secret access key"


## Step 06 - AWSCLI install

1. Install AWSCLI based on python deploy

    >  cd /root/utils/
    >  mkdir .awscli_install && cd .awscli_install
    >  python3 -m venv venv
    > source venv/bin/activate
    > curl -O https://bootstrap.pypa.io/get-pip.py
    > python3 get-pip.py
    > pip3 install awscli --upgrade
    > aws --version


## Step 07 - Development environment integration with cloud environment

1. Configure awscli with "AWS Access key ID" and "AWS Secret access key"

    > aws configure

    Example:
    AWS Access Key ID [None]: [YOUR_AWS_Access_key_ID]
    AWS Secret Access Key [None]: [YOUR_AWS_Secret_Access_key]
    Default region name [None]: eu-west-2
    Default output format [None]: json

**REMARKS** all this settings are available at ~/.aws folder for further change


## Step 06 - Basic development environment config

1. VSC Extentions 

    **Install of Hashcorp extentions for VSC **
    > Go to https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform
    or
    > Go to https://marketplace.visualstudio.com/items?itemName=4ops.terraform


## Step 08 - Basics tests and phase approval

1. xxx

    ** xxx **
    > xxx
  


### Useful reference links
- xxx - https://xxx
