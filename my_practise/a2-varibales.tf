variable "aws_region" {
    description = "THE REGION IN WHICH THE RESOURCES WOULD BE CONFIGURED"
    type = string
    default = "ap-south-1"
}

variable "instance_type" {
    description = "THE TYPE OF EC2 INSTANCE GOING TO BE CREATED"
    type = string
    default = "t2.micro"
  
}

variable "instance_type_list" {
    description = "MY EC2 INSTANCE"
    type = list(string)
    default = [ "t2.small", "t2.micro", "t2.large" ]
  
}

variable "instance_type_map" {
    description = "MY EC2 INSTANCE"
    type = map(string)
    default = {
       "qa" = "t2.small"
       "dev" = "t2.micro" 
       "prod" = "t2.large" 
    }
  
}



variable "instance_keypair" {
    description = "THIS IS THE KEY-PAIR TO ENTER INNTO THE EC2"
    type = string
    default = "terraform-key1"
  
}