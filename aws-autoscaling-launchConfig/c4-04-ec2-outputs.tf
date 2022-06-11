


output "ec2_bastion_instance_id" {
    description = "Get the instance id of the EC2"
    value = module.ec2-instance_bastion.id
  
}

output "ec2_bastion_public_ip" {
    description = "Get the piblic ip of the EC2"
    value = module.ec2-instance_bastion.public_ip
  
}

#Ouputs For App1
output "ec2_private_app1_instance_id" {
    description = "Get the  private instance id of the EC2"
    value = module.ec2-instance_private_app1.id
  
}

output "ec2_priv_app1_private_ip" {
    description = "Get the private ip of the EC2"
    value = module.ec2-instance_private_app1.private_ip
  
}


#Output For App2
output "ec2_private_instance_app2_id" {
    description = "Get the  private instance id of the EC2"
    value = module.ec2-instance_private_app2.id
  
}

output "ec2_priv_app2_private_ip" {
    description = "Get the private ip of the EC2"
    value = module.ec2-instance_private_app2.private_ip
  
}

#Output For App3
output "ec2_private_instance_app3_id" {
    description = "Get the  private instance id of the EC2"
    value = module.ec2-instance_private_app3.id
  
}

output "ec2_priv_app3_private_ip" {
    description = "Get the private ip of the EC2"
    value = module.ec2-instance_private_app3.private_ip
  
}