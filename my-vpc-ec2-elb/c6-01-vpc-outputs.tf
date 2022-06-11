
output "vpc_id" {
    description = "Get the VPC ID"
    value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
    description = "Get the VPC CIDR BLOCKS"
    value = module.vpc.vpc_cidr_block
}

output "vpc_pulic_subnets" {
    description = "Get the VPC Public Subnets"
    value = module.vpc.public_subnets
}

output "vpc_private_subnets" {
    description = "Get the VPC Private Subnets"
    value = module.vpc.private_subnets
}

output "vpc_nat_gateway" {
    description = "Get the VPC nat gateway"
    value = module.vpc.nat_public_ips
}

output "vpc_availality_zones" {
    description = "Get the VPC AZ's"
    value = module.vpc.azs
  
}



