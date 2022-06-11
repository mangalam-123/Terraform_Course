
module "ec2-instance_private" {
  depends_on = [module.vpc]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  name = "${var.environment}-privatevm"
  instance_type = var.instance_type
  ami = data.aws_ami.amz_linux2.id
  key_name = var.instance_Keypair
  vpc_security_group_ids = [module.private_sg.security_group_id]
  #monitoring = true
  subnet_ids = [ module.vpc.private_subnets[0],
      module.vpc.private_subnets[1]
  ]
  instance_count = var.private_instance_count
  user_data = file("${path.module}/app-install.sh")

  tags = local.common_tags


}