
#Application loadbalancer
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "6.0.0"
  name = "${local.name}-loadbalancer"
  load_balancer_type = "application"
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
  security_groups = [module.loadbalancer_sg.security_group_id]

  http_tcp_listeners = [
      {
          port = 80
          protocol = "HTTP"
          action_type = "redirect"
          redirect  = {
            port = "443"
            protocol = "HTTPS"
            status_code ="HTTP_301"
          }
      }
  ]

  # Target Groups 
  target_groups = [
    # App1 Target Group
    {
      name_prefix      = "app1-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }      
      protocol_version = "HTTP1"
      # App1 Target Group - Targets
      tags = local.common_tags # Target Group Tags
    },

  ]

   https_listeners = [
    # HTTPS Listener Index = 0 for HTTPS 443
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = module.acm.acm_certificate_arn
      action_type = "fixed-response"
      fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed Static message - for Root Context"
        status_code  = "200"
      }
    }, 
  ]

#Listener rules for app1* and app2* context-based-path-routing/Header-based-routinng

https_listener_rules = [ 
  {
  #Rule 1: for /app1* should go to app2 ec2 instances
 https_listener_index = 0
 priority = 1
actions = [
  {
    type = "forward"
    target_group_index = 0
  }]

conditions = [
  {
    path_patterns = ["/*"]
  }
]

},
]

tags = local.common_tags


}