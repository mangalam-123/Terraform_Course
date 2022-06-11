module "elb" {
 depends_on = [module.ec2-instance_private]
  source  = "terraform-aws-modules/elb/aws"
  version = "3.0.1"
  name = "${local.name}-myelb"
  subnets = [
      module.vpc.private_subnets[0],
      module.vpc.private_subnets[1]
  ]

  security_groups = [module.loadbalancer_sg.security_group_id]

  listener = [
    {
        instance_port = 80
        instance_protocol = "HTTP"
        lb_port = 80
        lb_protocol = "HTTP"
    },
    {
        instance_port = 80
        instance_protocol = "HTTP"
        lb_port = 81
        lb_protocol = "HTTP"
    },

  ]

health_check = {
    target = "HTTP:80/"
    interval = 30
    healthy_threshold = 2
    unhealthy_threshold = 2   
    timeout = 5
}


number_of_instances = var.private_instance_count
instances = [
    module.ec2-instance_private.id[0],
    module.ec2-instance_private.id[1]
]

tags = local.common_tags
}