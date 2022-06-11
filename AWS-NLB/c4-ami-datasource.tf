# Latest AMi datasource LINUX2
data "aws_ami" "amz_linux2" {
# To get the recent AMI
most_recent = true  
owners = ["amazon"]

# The filter's that are there with respect to the ami we want to create
filter {
  name = "name"
  values = ["amzn2-ami-hvm-*-gp2"]
}

filter {
  name = "root-device-type"
  values = ["ebs"]
}

filter {
  name = "virtualization-type"
  values = ["hvm"]

}

filter {
  name = "architecture"
  values = ["x86_64"]
}

}