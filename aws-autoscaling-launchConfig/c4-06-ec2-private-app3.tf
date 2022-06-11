#EC2 private host App-3
module "ec2-instance_private_app3" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  name = "${local.name}-Dev_Private_Host_App3"
  instance_type = var.instance_type
  ami =  data.aws_ami.amz_linux2.id
  key_name = var.instance_keypair
  vpc_security_group_ids = [module.private_security-group.security_group_id]
  subnet_ids = [module.vpc.private_subnets[0],
  module.vpc.private_subnets[1]
  ]
  instance_count = var.private-instance_count
  #user_data = file("${path.module}/myc2m-2-install.sh")
  user_data = templatefile("app3-ums-install.tmpl",{rds_db_endpoint = module.rdsdb.db_instance_address})
  tags = local.common_tags
}

