
#Only Bastion Outputs

output "ec2_bastion_instance_id" {
    description = "Get the instance id of the EC2"
    value = module.ec2-instance_bastion.id
  
}

output "ec2_bastion_public_ip" {
    description = "Get the piblic ip of the EC2"
    value = module.ec2-instance_bastion.public_ip
  
}

