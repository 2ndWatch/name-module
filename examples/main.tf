module "name" {
  source =  "../"

  environment = "snd"
  resource_type = "vpc"
  name          = "example"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name                   = module.name.name
  cidr                   = "10.1.0.0/16"
  azs                    = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets        = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
}