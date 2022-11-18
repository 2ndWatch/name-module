locals {
    env         = var.environment
    region      = data.aws_region.current.name
    az          = var.availability_zone != null ? lower(substr(var.availability_zone, 0, 1)) : null # Ensure only first character of AZ

    ### Naming Format: acme-<env>-<region>-elb-<name>
    std_prefix      = local.az != null ? format("acme-%s-%s%s", local.env, local.region, local.az) : format("acme-%s-%s", local.env, local.region)

    ### Naming Format: bokf-<env>-<region>-vpc-<name>
    region_prefix   = format("acme-%s-%s", local.env, local.region) # Regional Resources

    ### Naming Format: acme-<env>-usr-<name>
    iam_prefix      = format("acme-%s", local.env) # Global Resources
    
    ### Build Naming format for output variable by resource type lookup in lists below
    name            = contains(local.std_resource, var.resource_type) ? format("%s-%s-%s", local.std_prefix, var.resource_type, var.name) : contains(local.iam_resource, var.resource_type) ? format("%s-%s-%s", local.iam_prefix, var.resource_type, var.name) : contains(local.region_resource, var.resource_type) ? format("%s-%s-%s", local.region_prefix, var.resource_type, var.name) : null

    std_resource = [
		"ebs",
		"ec2",
		"ecs",
		"eip",
		"eks",
		"elb",
		"eni",
		"lc",
		"clg",
		"rds",
		"sg",
		"sns",
		"sqs",
		"s3",
		"vpce",
		"cgw",
		"vpn",
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
		"vpg"
    ]
    iam_resource = [
		"role",
		"usr"
    ]
}

data "aws_region" "current" {}
