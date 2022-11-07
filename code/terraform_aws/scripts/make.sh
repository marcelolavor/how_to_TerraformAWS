#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -e [environment] -p [project_name]"
   echo -e "\n Where [environment] can be:"
   echo -e "\t 'dev' to make development environment"
   echo -e "\t 'pre' to make pre-production environment"
   echo -e "\t 'prd' to make production environment"
   echo -e "\n [project_name] is your project name (without space and special character)\n\n"
   exit 1 # Exit script after printing help
}

while getopts "e:p:" opt
do
   case "$opt" in
      e ) environment="$OPTARG" ;;
      p ) project="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$environment" ] || [ -z "$project" ]
then
   echo -e "\nSome or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
terraform plan -no-color -target="module.network_module" -var-file="./global.tfvars" -var="resource_tags["environment"]=$environment" -var="Name=$project"