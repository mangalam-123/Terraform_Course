

# Security Group for Public Load Balancer
module "loadbalancer_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"

  name = "Loadbalancer-SG"
  description = "this loadbalancer sg allows the http traffic on port 80 and also on port 81"
  vpc_id = module.vpc.vpc_id
  ingress_rules = ["http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_with_cidr_blocks =[
  {
    from_port = 81
    to_port = 81
    protocol = 6
    description = "Allow http traffic from port 81"
    cidr_blocks = "0.0.0.0/0"
  }
  ] 
  egress_rules = ["all-all"]
  tags = local.common_tags
}