locals {
  env    = var.environment
  region = data.aws_region.current.name
  az     = var.availability_zone != null ? lower(substr(var.availability_zone, 0, 1)) : null # Ensure only first character of AZ

  ### Naming Format: acme-<env>-<region>-<az>-elb-<name>
  az_prefix = local.az != null ? format("acme-%s-%s-%s", local.env, local.region, local.az) : format("acme-%s-%s", local.env, local.region)

  ### Naming Format: acme-<env>-<region>-vpc-<name>
  region_prefix = format("acme-%s-%s", local.env, local.region) # Regional Resources

  ### Naming Format: acme-<env>-usr-<name>
  global_prefix = format("acme-%s", local.env) # Global Resources

  ### Build Naming format for output variable by resource type lookup in lists below
  name = contains(local.az_resource, var.resource_type) ? format("%s-%s-%s", local.az_prefix, var.resource_type, var.name) : contains(local.global_resource, var.resource_type) ? format("%s-%s-%s", local.global_prefix, var.resource_type, var.name) : contains(local.region_resource, var.resource_type) ? format("%s-%s-%s", local.region_prefix, var.resource_type, var.name) : null

  az_resource = [
    "ebs",
    "ec2",
    "elb",
    "eni",
    "flg"
  ]
  
  region_resource = [
    "ami",
    "dxconn",
    "igw",
    "rtbl",
    "snet",
    "tgw",
    "vpc",
    "waf",
    "rt",
    "vpg",
    "vpce",
    "cgw",
    "clg",
    "rds",
    "sg",
    "sns",
    "sqs",
    "ecs",
    "eip",
    "eks",
    "vpn",
    "s3"
  ]

  global_resource = [
    "role",
    "usr"
  ]
}

data "aws_region" "current" {}
