
output "bucket_arn" {
    description = "Arn of the s3 bucket"
    value = aws_s3_bucket.s3_bucket.arn
  
}

output "bucket_name" {
    description = "name of the s3 bucket"
    value = aws_s3_bucket.s3_bucket.id
  
}

output "domain" {
    description = "diomain name of bucket"
    value = aws_s3_bucket.s3_bucket.website_domain
  
}

output "endpoint" {
    description = "Arn of the s3 bucket"
    value = aws_s3_bucket.s3_bucket.website_endpoint
  
}

