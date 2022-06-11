
#Outputs as we require we can use this output for some other module for referrence
output "vpc_id" {
    description = "This gives the vpc id for the curret VPC of our environment"
    value = module.vpc.vpc_id 
}

output "vpc_cidr_blocks" {
    description = "The cidr block for my VPC"
    value = module.vpc.vpc_cidr_block
}
 output "vpc_public_subnets" {
   description = "The pulic subnets"
   value = module.vpc.public_subnets
 }

 output "vpc_private_subnets" {
   description = "The private subnets"
   value = module.vpc.private_subnets
 }

 output "vpc_dataase_subnets" {
   description = "The database subnets"
   value = module.vpc.database_subnets
 }

 output "vpc_availability_zones" {
     description = "The azs details of my VPC"
     value = module.vpc.azs
 }

 output "vpc_nat_publicip" {
     description = "The nat-gateway public ip"
     value = module.vpc.nat_public_ips
 }

