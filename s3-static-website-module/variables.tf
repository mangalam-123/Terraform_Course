
variable "bucket_name" {
  description = "S3 bucket name should be unique across aws"
  type = string
}

variable "tags" {
  description = "The tags of the s3 buckets"
  type = map(string)
  default = {}
}

variable "aws_region" {
    description = "The region of resource provisioning"
    default = "us-east-2"
}