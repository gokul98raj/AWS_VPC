// Code for Create VPC with single Public and Private Subnet
// Below for Creating VPC
resource "aws_vpc" "custom_vpc" {
  cidr_block = var.cidr_block
  instance_tenancy = var.instance_tenancy
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    "Name" = "custom_VPC"
  }
}

// Below for Create Subnets

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = var.public_cidr_block
  
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = var.private_cidr_block
}

// Below for Create Internet Gateway

resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.custom_vpc.id

    tags = {
      "Name" = "custom_IGW"
    } 
}

// Below for Create Route Table, Route and Association
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    "Name" = "Public_RT"
  }
}

resource "aws_route_table_association" "public_rt_associate" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id = aws_subnet.public_subnet.id

}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    "Name" = "Private_RT"
  } 
}

resource "aws_route_table_association" "private_rt_associate" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id = aws_subnet.private_subnet.id
}