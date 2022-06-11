
# NAME of the vpc block
variable "My_vpc" {
    description = "Name of the virtaul private cloud"
    type = string
    default = "VPC_Dev"
}

#VPC CIDR BLOCK and its value
variable "vpc_cidr_block" {
  description = "This is the vpc network cidr block range"
  type = string
  default = "10.230.0.0/25" 
}

variable "vpc_availability_zones" {
    description = "The different AZ's inside the VPC"
    type = list(string)
    default = [ "us-east-2a", "us-east-2b" ]  
}

# Public subnets inside my VPC
variable "vpc_public_subnets" {
  description = "THe public subnet inside my network"
  type = list(string)
  default = [ "10.230.0.0/28", "10.230.0.32/28" ]
}

#Private subnets inside my VPC
variable "vpc_private_subnets" {
  description = "The private subnets inside my VPC"
  type = list(string)
  default = [ "10.230.0.16/28", "10.230.0.48/28" ] 
}

#Database subnets inside my VPC
variable "vpc_database_subnets" {
  description = "My database subnets inside my VPC"
  type = list(string)
  default = ["10.230.0.64/28", "10.230.0.80/28"]
}

#Database subnet groups allowed
variable "Database_subnet_group" {
  description = "Allow sunet group for database inside my VPC"
  type = bool
  default = true
}

#Database Allow RouteTable in my VPC
variable "Database_Route_Table" {
  description = "Allow route to my Database inside my VPC"
  type = bool
  default = true
}

#Enable NatGate inside my VPC
variable "vpc_natgateway" {
  description = "Allow natgateway inside my VPC"
  type = bool
  default = true
}

#Enable single Natgateway inside my VPC
variable "vpc_single_natgateway" {
  description = "Allow single natgateway inside my VPC"
  type = bool
  default = true
}

