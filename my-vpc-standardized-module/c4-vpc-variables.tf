variable "my_vpc" {
    description = "THis is the vpc we have in our region"
    type = string
    default = "MyVpc"
    
}

variable "vpc_cidr_block" {
    description = "This is VPC cidr block"
    type = string
    default = "10.230.0.0/25"
}

variable "vpc_availability_zones" {
    description = "This is the az's required"
    type = list(string)
    default = ["ap-south-1a","ap-south-1b"]
}


variable "my_public_subnets" {
    description = "This is the public subnet"
    type = list(string)
    default = [ "10.230.0.0/28","10.230.0.32/28" ]
  
}

variable "my_private_subnets" {
    description = "This is the private subnet"
    type = list(string)
    default = [ "10.230.0.16/28","10.230.0.48/28" ]
  
}

variable "my_database_subnets" {
    description = "This is the public subnet"
    type = list(string)
    default = [ "10.230.0.64/28","10.230.0.80/28" ]
  
}

variable "database_subnet_group" {
  description = "My database subnet group"
  type = bool
  default = true
}

variable "database_subnet_route_table" {

    description = "This is my database RT"
    type = bool
    default = true
}

variable "vpc_enable_nat_gatewat" {
    description = "This is the nat gateway for my VPC"
    type = bool
    default = true
}

variable "vpc_single_nat_gateway" {
  description = "This is to anable single nat gateway"
  type = bool
  default = true
}



