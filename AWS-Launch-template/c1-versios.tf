#Terraform registry and innitializing local backend and downloading the modules and providers plugins

terraform {
  required_version = "~> 1.0"
  required_providers {

      aws = {
          source = "hashicorp/aws"
          version =  "4.0"
      }

      null = {
          source = "hashicorp/null"
          version = "~> 3.0"
      }
      random = {
          source = "hashicorp/random"
          version = "~> 3.0"
      }
  }
}

provider "aws" {
    region = var.aws_region
    profile = "default"
  
}

resource "random_pet" "this" {
  length = 2
}