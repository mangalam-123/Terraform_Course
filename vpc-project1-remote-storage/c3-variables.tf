variable "aws_region" {
  description = "My default region"
  default = "us-east-2"
}

variable "Environment" {
  description = "The common env name"
  type = string
  default = "PREPROD"
}

variable "Business_unit" {
  description = "The Business_unit"
  type = string
  default = "HR"
}