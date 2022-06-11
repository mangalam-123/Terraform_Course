#RDS security group with port 3306 and within vpc cidr
module "rds_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"

  name = "RDS-SG"
  description = "this rds sg allows the database traffic within the vpc"
  vpc_id = module.vpc.vpc_id
  ingress_with_cidr_blocks =[
  {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    description = "Allow http traffic from port 3306 within vpc"
    cidr_blocks = "10.230.0.0/25"
  }
  ] 
  egress_rules = ["all-all"]
  tags = local.common_tags
}