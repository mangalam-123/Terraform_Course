#    VPC RESOURCE--------------> c2m_vpc 

resource "aws_vpc" "c2m_vpc" {
    #name = "my-c2m-vpc"
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_hostnames = true
    
    tags = {
    Name = "my-c2m-vpc"
  }  
}

#Public - Subnet --------------> c2m_vpc

resource "aws_subnet" "public_subnet" {
  count = length(var.vpc_public_subnets)
  vpc_id     = aws_vpc.c2m_vpc.id
  cidr_block = element(var.vpc_public_subnets, count.index)
  availability_zone = element(var.vpc_availability_zone, count.index)

  tags = {
    Name = "public-subnets"
  }
}

#Private - Subnet ----------------> c2m_vpc

resource "aws_subnet" "private_subnet" {
  count = length(var.vpc_private_subnets)
  vpc_id     = aws_vpc.c2m_vpc.id
  cidr_block = element(var.vpc_private_subnets, count.index)
  availability_zone = element(var.vpc_availability_zone, count.index)

  tags = {
    Name = "private-subnets"
  }
}

#Internet Gateway 

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.c2m_vpc.id
  tags = {
     Name = "my-igw-c2m"
  }
}

#Public - RouteTable

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.c2m_vpc.id

   route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }
    
  tags = {
      Name = "my_public_rt"
  }
}


#Private RouteTable

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.c2m_vpc.id

  tags = {
      Name = "my_private_rt"
  }
}

#Route Table Association with Public

resource "aws_route_table_association" "public" {
  count = length(var.vpc_public_subnets)
  subnet_id = element(aws_subnet.public_subnet.*.id,count.index)
  route_table_id = aws_route_table.public_rt.id
}

#Route Table Association with Private

resource "aws_route_table_association" "private" {
  count = length(var.vpc_private_subnets)
  subnet_id = element(aws_subnet.private_subnet.*.id,count.index)
  route_table_id = aws_route_table.private_rt.id
}




