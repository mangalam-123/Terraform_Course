
terraform {
    required_version = "~>1.0"
    required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "~>3.0"
      }
    }

    #Adding s3 for remote-state-storage
    backend "s3"{
    bucket = "my-vpc-remote-state-bucket"
    key = "dev/vpc-project1/terraform.tfstate"
    region = "us-east-2"

    #adding Dynamo-db for state locking
    dynamodb_table = "dev-project1"
}

}

provider "aws" {
  region = var.aws_region
  profile = "default"
}







