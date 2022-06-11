#Private Secuirt Group
module "private_security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"
  name = "${local.name}-PrivateSG"
  vpc_id = module.vpc.vpc_id
  description = "Allow ssh on port 22 and hhtp traffic within the network of CIDR"
  ingress_rules = ["ssh-tcp","http-80-tcp","http-8080-tcp"]
  #ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules = [ "all-all" ]
  tags = local.common_tags
}