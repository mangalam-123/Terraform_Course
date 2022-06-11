


output "ec2_bastion_instance_id" {
    description = "Get the instance id of the EC2"
    value = module.ec2-instance_bastion.id
  
}

output "ec2_bastion_public_ip" {
    description = "Get the piblic ip of the EC2"
    value = module.ec2-instance_bastion.public_ip
  
}


output "ec2_private_instance_id" {
    description = "Get the  private instance id of the EC2"
    value = module.ec2-instance_private.id
  
}

output "ec2_priv_private_ip" {
    description = "Get the private ip of the EC2"
    value = module.ec2-instance_private.private_ip
  
}