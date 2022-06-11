
module "vpc" {

  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"
  name = "vpc-dev"
  cidr = "10.230.0.0/25"
  azs = ["ap-south-1a","ap-south-1b","ap-south-1c"]
  public_subnets = ["10.230.0.0/28","10.230.0.32/28"]
  private_subnets = ["10.230.0.16/28","10.230.0.48/28"]
  database_subnets = ["10.230.0.64/28","10.230.0.80/28"]
 

 # {e6c15867-88b6-11ea-99c8-806e6f6e6963}
  create_database_subnet_group = true
  create_database_subnet_route_table = true

  # DNS HOSTNAME 
    enable_nat_gateway = true
    single_nat_gateway = true

    enable_dns_hostnames = true
    enable_dns_support = true

    public_subnet_tags = {
        Type = "public-subnets"
    }

    private_subnet_tags = {
        Type = "private-subnets"
    }

    database_subnet_tags = {
        Type = "database-subnets"
    }

    tags = {
        Onwer = "Kumar"
        Environment = "DEV"
    }

    vpc_tags = {
        Name = "DEV_VPC"
    }
}