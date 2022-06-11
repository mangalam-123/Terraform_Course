

output "my_bucket_arn" {
  description = "My Bucket ARN"
  value = module.my_website_s3.bucket_arn
}



output "my_bucket_name" {
  description = "My Bucket Name"
  value = module.my_website_s3.bucket_name
}


output "my_bucket_domain" {
  description = "My Bucket domain"
  value = module.my_website_s3.domain
}

output "my_bucket_endpoint" {
  description = "My Bucket domain"
  value = module.my_website_s3.endpoint
}

