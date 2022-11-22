# Purpose
This repository is a Terraform resource naming module that can be used to standardize cloud resource names in a centralized location. As currently constructed this module will only work with AWS but can be modified to work with any cloud provider (or any Terraform provider).

# Assumptions
* This repository is intended to be sample code or a starting point for a client to create a naming standard.

* The naming module can be modified to fit any Terraform provider.

# Prerequisites
* Terraform Version 0.12 and later
    installation guide ->https://learn.hashicorp.com/tutorials/terraform/install-cli
* AWS CLI
    Installation guide ->https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html

# Usage
* This module produces three types of names:
  - Availability zone - Resources that are deployed in an availability zone IE ec2 or eni
  - Regional - Resources that are deployed in a region IE vpc or security group
  - Global - Resource that are global IE IAM resources.




