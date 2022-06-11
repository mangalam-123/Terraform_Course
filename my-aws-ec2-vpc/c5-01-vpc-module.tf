
module "vpc" {
    
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"
  name = "${local.name}-${var.My_vpc}"
  cidr = var.vpc_cidr_block
  azs = var.vpc_availability_zones
  public_subnets = var.my_public_subnets
  private_subnets = var.my_private_subnets
  database_subnets = var.my_database_subnets

  create_database_subnet_group = var.database_subnet_group
  create_database_subnet_route_table = var.database_subnet_route_table

  # DNS HOSTNAME 
    enable_nat_gateway = var.vpc_single_nat_gateway
    single_nat_gateway = var.vpc_single_nat_gateway

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

    tags = local.common_tags

    vpc_tags = local.common_tags
}