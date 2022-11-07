# how_to_TerraformAWS

This HowTo will describes step-by-step an example about how to use Terraform with AWS in order to deploy a simple scenario of an IaC (Infrastructure as Code).

Along the steps, you will be able to figure out tecnical details about its implementation and purposes. In case of any doubt, please feel free to contact me at marcelo.lavor@gmail.com.

## Phase 1 - Development Environment

01 - Development environment setup

02 - Environment initial configutarion

03 - Basics tests and phase approval


## Phase 2 - Environment integration

04 - Account creation at AWS Cloud

05 - Basic cloud config

06 - Basic Terraform config

07 - Development environment integration with cloud environment

08 - Basics tests and phase approval


## Phase 3 - IaC components creation

09 - Project assumptions and solution design

10 - IaC project specification and code definition

11 - IaC Development and basics tests for every each component

12 - IaC templates definition and phase approval


## Phase 4 - Project creation

13 - Project design for full cycle deployment

14 - Solution review and adjustments

15 - Security and resilience reviews

16 - Full cycle tests and phase approval


## Phase 5 - Project conclusion

17 - Environment documentation and code review

18 - Environment clean up for final test

19 - Final test from scratch and additional adjustments if needed

20 - Project conclusion and acceptance


## References
- Terraform Modules for AWS - https://github.com/terraform-aws-modules
- AWS limits: https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html
- Subnets limit per VPC: https://docs.aws.amazon.com/vpc/latest/userguide/configure-subnets.html
- Variables: https://k21academy.com/terraform-iac/variables-in-terraform/
- Data source: https://developer.hashicorp.com/terraform/language/data-sources
- Shell provider: https://registry.terraform.io/providers/scottwinkler/shell/latest/docs/resources/shell_script_resource
- Nullable variables: https://developer.hashicorp.com/terraform/language/values/variables?optInFrom=terraform-io#disallowing-null-input-values

- Plan: https://developer.hashicorp.com/terraform/cli/commands/plan
- Apply: https://developer.hashicorp.com/terraform/cli/commands/apply
- Destroy: https://developer.hashicorp.com/terraform/cli/commands/destroy