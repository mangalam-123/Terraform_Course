
# VPC Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"
  # General inputs
  name = "${local.name}-${var.My_vpc}"
  cidr = var.vpc_cidr_block
  azs = var.vpc_availability_zones
  public_subnets = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets
  #database_subnets = var.vpc_database_subnets
  
  #create dataase RT ad subnet group
  #create_database_subnet_group = var.Database_subnet_group
  #create_database_subnet_route_table = var.Database_Route_Table

  #eable nat and single nat gateway
  enable_nat_gateway = var.vpc_natgateway
  single_nat_gateway = var.vpc_single_natgateway

  #enable dns hostname and support
  enable_dns_hostnames = true
  enable_dns_support = true

  #creating subnet and db subnets tags

  public_subnet_tags = {
      Type = "public-subnets"
  }

  private_subnet_tags = {
      Type = "private-subnets"
  }

  database_subnet_tags = {
      Type = "Database-subnets"
  }

  tags = local.common_tags
  

}