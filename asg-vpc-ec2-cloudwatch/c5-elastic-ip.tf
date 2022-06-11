
#Resource creation of elastic ip and association with the bastion host
resource "aws_eip" "Public_host" {
  
  depends_on = [
    module.vpc, module.ec2-instance_bastion
  ]
  instance = module.ec2-instance_bastion.id[0]
  vpc = true
  tags = local.common_tags
}