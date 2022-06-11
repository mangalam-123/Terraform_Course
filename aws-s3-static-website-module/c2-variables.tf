variable "aws_region" {
  description = "My default region"
  default = "us-east-2"
}
variable "my_website_bucket" {
  description = "This is my bucket"
  type = string
  default = "my-static-website-007"
}

variable "my_bucket_tags" {
  description = "This is the tags for my bucket"
  type = map(string)
  default = {
      Environment = "SAP"
      terraform = "true"
      newtag1 = "tag1" 
  }
}