
module "loadbalancer_sg" {
  
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"
  # insert the 3 required variables here
  name = "ALB-loadbalancer-sg"
  description = "THis is SSH port open for everybody with vpc and egress open to all"
  vpc_id = module.vpc.vpc_id
  ingress_rules = ["http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules = ["all-all"]
  #egress_cidr_blocks = ["0.0.0.0/0"]
  tags = local.common_tags
  ingress_with_cidr_blocks = [
   {
   from_port = 81
   to_port = 81
   protocol = 6
   description = "Allow port 81 from anywhere"
   cidr_blocks = "0.0.0.0/0"
   }
 ]

}