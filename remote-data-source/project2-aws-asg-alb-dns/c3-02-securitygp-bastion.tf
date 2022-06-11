#Public Secuirt Group
module "public_security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"
  name = "${local.name}-PublicSG"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  description = "Allow ssh on port 22 from anywhere"
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules = [ "all-all" ]
  tags = local.common_tags
}