

module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"
  # insert the 3 required variables here
  name = "public-bastion-sg"
  description = "THis is SSH port open for everybody and egress open to all"
  vpc_id = module.vpc.vpc_id
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules = ["all-all"]
  #egress_cidr_blocks = ["0.0.0.0/0"]
  tags = local.common_tags


}