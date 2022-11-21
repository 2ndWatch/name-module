# Purpose
This repository is a Terraform resource naming module that can be used to standardize cloud resource names in a centralized location. As currently constructed this module will only work with AWS, but can be easily modified to work with any cloud provider (or any AWS provider).

# Prerequisites
* Terraform Version 0.12 and later
    installation guide ->https://learn.hashicorp.com/tutorials/terraform/install-cli
* AWS CLI
    Installation guide ->https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html

# Example Usage
`module "name" {`
  `source =  "../"`

  `environment = "snd"`
  `resource_type = "vpc"`
  `name          = "example"`
`}`

`module "vpc" {`
  `source  = "terraform-aws-modules/vpc/aws"`
  `version = "3.14.0"`
  `# Example Name is acme-snd-us-east-1-example`
  `name                   = module.name.name`
  `cidr                   = "10.1.0.0/16"`
  `azs                    = ["us-east-1a", "us-east-1b", "us-east-1c"]`
  `private_subnets        = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]`
`}`




