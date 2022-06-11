

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "my-vpc-remote-state-bucket"
    key = "dev/vpc-project1/terraform.tfstate"
    region = "us-east-2"
   }
}

/*

vpc_id = data.terraform_remote_state.vpc.ouputs.vpc_id

subnet_id = data.terraform_remote_state.vpc.ouputs.public_subnets[0]

*/