
module "ec2-instance_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  name = "${var.environment}-bastion"
  #instance_count = 5
  instance_type = var.instance_type
  ami = data.aws_ami.amz_linux2.id
  key_name = var.instance_Keypair
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  #monitoring = true
  subnet_id = module.vpc.public_subnets[0]

  tags = local.common_tags


}