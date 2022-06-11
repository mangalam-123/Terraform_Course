

provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "temp_ec2" {
  
}


#terraform import aws_instance.temp_ec2 i-0a35f6238e904b0e0