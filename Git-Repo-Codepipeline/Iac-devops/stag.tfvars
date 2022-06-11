
# Make the values of the VPC resource here
My_vpc = "Vpc-DEV"
vpc_cidr_block = "10.230.0.0/20"
vpc_availability_zones = [ "ap-south-1a", "ap-south-1b" ]
vpc_public_subnets = [ "10.230.1.0/28", "10.230.1.32/28" ]
vpc_private_subnets = [ "10.230.1.16/28", "10.230.1.48/28" ]
vpc_database_subnets = [ "10.230.1.64/28","10.230.1.80/28" ]
vpc_natgateway = true
vpc_single_natgateway = true
Database_Route_Table = true
Database_subnet_group = true


# Variables for EC2 Instance
instance_type = "m4.large"
instance_keypair = "terraform-key"
private-instance_count = 2

#Dns name for dev env
dns_name = "iacdevops-stag.myappstore.tech"
