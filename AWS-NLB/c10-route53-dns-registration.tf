# Register a DNS for route53 and create an alias for loadbalancer ad also an record set
# dterraform validatefault Route
resource "aws_route53_record" "myapp_dns" {
  depends_on = [
    module.nlb
  ]
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = "nlb.myappstore.tech"
  type    = "A"
  alias {
    name                   = module.nlb.lb_dns_name
    zone_id                = module.nlb.lb_zone_id
    evaluate_target_health = true
  }
}

