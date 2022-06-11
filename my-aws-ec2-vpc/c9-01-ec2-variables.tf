

variable "instance_type" {
    description = "Type of EC2 Instance"
    type = string
    default = "t2.micro"
  
}

variable "instance_Keypair" {
    description = "Ec2-Instance-key"
    type = string
    default = "terraform-key1"
  
}

variable "private_instance_count" {
    description = "The number of private EC2 Instances"
    type = number
    default = 1
  
}