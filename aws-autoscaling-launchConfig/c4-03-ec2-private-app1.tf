#EC2 private host App1
module "ec2-instance_private_app1" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  name = "${local.name}-Dev_bastion_Host_App1"
  instance_type = var.instance_type
  ami =  data.aws_ami.amz_linux2.id
  key_name = var.instance_keypair
  vpc_security_group_ids = [module.private_security-group.security_group_id]
  subnet_ids = [module.vpc.private_subnets[0],
  module.vpc.private_subnets[1]
  ]
  instance_count = var.private-instance_count
  user_data = file("${path.module}/myec2app-1-install.sh")
  tags = local.common_tags
}

