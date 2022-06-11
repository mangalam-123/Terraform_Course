
# register a DNS for route53 and create an alias for loadbalancer ad also an record set
#deafault route
resource "aws_route53_record" "myapp_dns" {
  depends_on = [
    module.alb
  ]
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = "www.myappstore.tech"
  type    = "A"
  alias {
    name                   = module.alb.this_lb_dns_name
    zone_id                = module.alb.this_lb_zone_id
    evaluate_target_health = true
  }
}

#for App1 routre dns name
resource "aws_route53_record" "myapp1_dns" {
  depends_on = [
    module.alb
  ]
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = var.app1_dns_name
  type    = "A"
  alias {
    name                   = module.alb.this_lb_dns_name
    zone_id                = module.alb.this_lb_zone_id
    evaluate_target_health = true
  }
}

#For app2 routing dns name
resource "aws_route53_record" "myapp2_dns" {
  depends_on = [
    module.alb
  ]
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = var.app2_dns_name
  type    = "A"
  alias {
    name                   = module.alb.this_lb_dns_name
    zone_id                = module.alb.this_lb_zone_id
    evaluate_target_health = true
  }
}