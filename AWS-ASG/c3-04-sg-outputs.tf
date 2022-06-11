

#public security group outputs
output "public_security-sg_vpc_id" {
  description = "THis is to get the vpc id for the associated secuirty group"
  value = module.public_security-group.security_group_vpc_id
}

output "public_security-sg_sg_id" {
  description = "THis is to get the vpc id for the associated secuirty group"
  value = module.public_security-group.security_group_id
}

output "public_security-sg_sg_name" {
  description = "THis is to get the vpc id for the associated secuirty group"
  value = module.public_security-group.security_group_name
}

#private security group outputs

output "private_security-sg_vpc_id" {
  description = "THis is to get the vpc id for the associated secuirty group"
  value = module.private_security-group.security_group_vpc_id
}

output "private_security-sg_sg_id" {
  description = "THis is to get the vpc id for the associated secuirty group"
  value = module.private_security-group.security_group_id
}

output "private_security-sg_sg_name" {
  description = "THis is to get the vpc id for the associated secuirty group"
  value = module.private_security-group.security_group_name
}