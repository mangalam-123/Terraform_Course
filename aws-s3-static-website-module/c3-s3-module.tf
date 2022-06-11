
module "my_website_s3" {
  source = "./modules/aws-s3-static-website"
  bucket_name  = var.my_website_bucket
  tags = var.my_bucket_tags
}