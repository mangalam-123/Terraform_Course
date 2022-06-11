#EC2 bastion host 
module "ec2-instance_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  name = "${local.name}-Dev_bastion_Host"
  instance_type = var.instance_type
  ami =  data.aws_ami.amz_linux2.id
  key_name = var.instance_keypair
  vpc_security_group_ids = [module.public_security-group.security_group_id]
  subnet_id = module.vpc.public_subnets[0]
  tags = local.common_tags
  user_data = file("${path.module}/jumpbox-install.sh")
}

