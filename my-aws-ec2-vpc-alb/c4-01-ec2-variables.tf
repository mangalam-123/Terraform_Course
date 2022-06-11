
variable "instance_type" {
    description = "The type of my ec2-instances"
    type = string
    default = "t2.micro"
}

variable "instance_keypair" {
    description = "The key pair for my ec2-instances"
    type = string
    default = "terraform-key1"
}

variable "private-instance_count" {
  description = "The no of my private ec2-instances"
  type = number
  default= 2
}