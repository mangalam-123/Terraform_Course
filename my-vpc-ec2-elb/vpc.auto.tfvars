#For the resource etter to make their separate files
my_vpc = "MyVPC"
vpc_cidr_block = "10.230.0.0/25"
my_public_subnets = [ "10.230.0.0/28", "10.230.0.32/28" ]
my_private_subnets = [ "10.230.0.16/28", "10.230.0.48/28" ]
my_database_subnets = [ "10.230.0.64/28", "10.230.0.80/28" ]
vpc_enable_nat_gatewat = true
vpc_single_nat_gateway = true
vpc_availability_zones = [ "ap-south-1a", "ap-south-1b" ]
database_subnet_group = true
database_subnet_route_table = true