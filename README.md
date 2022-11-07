# HowTo - TerraformAWS

This ***HowTo*** is still under construction.

<p>It will describes step-by-step an example about how to use Terraform with AWS in order to deploy a real scenario of an IaC (Infrastructure as Code) deployent.</p>

<p>At present, the following status is found about its implementation and I will keep it updated as far it become til complete.</p>

- Terraform overall project structred and described in markeddown files
- Technical details about how to implement the development environment into a docker
- Development environment ready based on a docker very light image of a linux Ubuntu and required applications
- Overall terraform code design created for customized resources and demanded modules 
- Terraform files implemented for Newwork VPC deployment in AWS environment
- Main Terraform code development with modules calls and shell scripts 


### Next steps

- Conclude the module for EC2 instances creation integrated with network module outcomes
- Work on golden image module
&nbsp;  
&nbsp;  

---
## Instructions
Along the steps, you will be able to figure out tecnical details about its implementation and purposes. In case of any doubt, please feel free to contact me at marcelo.lavor@gmail.com.
&nbsp;  
&nbsp;  

### [Phase 1 - Development Environment](/Instructions/Phase 1 - Development Environment.md)

01 - Development environment setup

02 - Environment initial configutarion

03 - Basics tests and phase approval
&nbsp;  
&nbsp;  

### [Phase 2 - Environment integration](Instructions/Phase 2 - Environment integration.md)

04 - Account creation at AWS Cloud

05 - Basic cloud config

06 - Basic Terraform config

07 - Development environment integration with cloud environment

08 - Basics tests and phase approval
&nbsp;  
&nbsp;  

### [Phase 3 - IaC components creation](Instructions/Phase 3 - IaC components creation.md)

09 - Project assumptions and solution design

10 - IaC project specification and code definition

11 - IaC Development and basics tests for every each component

12 - IaC templates definition and phase approval
&nbsp;  
&nbsp;  

### [Phase 4 - Project creation](Instructions/Phase 4 - Project creation.md)

13 - Project design for full cycle deployment

14 - Solution review and adjustments

15 - Security and resilience reviews

16 - Full cycle tests and phase approval
&nbsp;  
&nbsp;  

### [Phase 5 - Project conclusion](Instructions/Phase 5 - Project conclusion.md)

17 - Environment documentation and code review

18 - Environment clean up for final test

19 - Final test from scratch and additional adjustments if needed

20 - Project conclusion and acceptance
&nbsp;   
&nbsp;  
&nbsp;  

---

### **References**

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
