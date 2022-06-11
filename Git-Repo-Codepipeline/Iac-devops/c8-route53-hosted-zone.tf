
#data source for route53 service
data "aws_route53_zone" "mydomain" {
  name = "myappstore.tech"
}

output "Mydomain_zone_id" {
  description = "This is the Zone id of my domain"
  value = data.aws_route53_zone.mydomain.zone_id
}

output "Mydomain_name" {
  description = "This is the name of my domain"
  value = data.aws_route53_zone.mydomain.name
}

