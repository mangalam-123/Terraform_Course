
#Variables for vpc,route_table,subnets,region etc 

variable "aws_region" {
  description = "The region in which you want to provision resources"
  default = "us-east-2"
}

variable "instance_key" {
  description = "This is the key for the imstance"
  default = "terraform-key.pem"
  
}


variable "vpc_cidr"{
 description = "The vpc cidr blocks is specified with the classless ip addressing"
 type = string
 default = "10.230.0.0/25"
} 

variable "vpc_public_subnets" {
  description = "The public sub-netowrk with cidr block"
  type = list(string)
  default = ["10.230.0.0/28","10.230.0.32/28"]
}

variable "vpc_private_subnets" {
  description = "The private sub-netowrk with cidr block"
  type = list(string)
  default = [ "10.230.0.16/28", "10.230.0.48/28" ]
}

variable "vpc_availability_zone" {
  description = "The deafult availablity zone"
  type = list(string)
  default = ["us-east-2a","us-east-2b"]  
}




