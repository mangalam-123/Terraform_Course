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
      backend "s3"{
        bucket = "my-vpc-remote-state-bucket"
        key = "dev/project2-app1/terraform.tfstate"
        region = "us-east-2"

        dynamodb_table = "dev-project2-app1"
      }

      
  
}

provider "aws" {
    region = var.aws_region
    profile = "default"
  
}

resource "random_pet" "this" {
  length = 2
}