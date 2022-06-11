#EC2 private host App-2
module "ec2-instance_private_app2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  depends_on = [module.vpc]
  name = "${local.name}-Dev_bastion_Host_App2"
  instance_type = var.instance_type
  ami =  data.aws_ami.amz_linux2.id
  key_name = var.instance_keypair
  vpc_security_group_ids = [module.private_security-group.security_group_id]
  subnet_ids = [module.vpc.private_subnets[0],
  module.vpc.private_subnets[1]
  ]
  instance_count = var.private-instance_count
  user_data = file("${path.module}/myc2m-2-install.sh")
  tags = local.common_tags
}

