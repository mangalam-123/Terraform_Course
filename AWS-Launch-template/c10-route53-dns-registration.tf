# Register a DNS for route53 and create an alias for loadbalancer ad also an record set
# dterraform validatefault Route
resource "aws_route53_record" "myapp_dns" {
  depends_on = [
    module.alb
  ]
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = "asg-lt.myappstore.tech"
  type    = "A"
  alias {
    name                   = module.alb.lb_dns_name
    zone_id                = module.alb.lb_zone_id
    evaluate_target_health = true
  }
}

