provider "aws" {
  region = "us-east-1"  
  secret_key = "${ secrets.ACCESS_KEY }"
  access_key = "${ secrets.SECRET_KEY }"
}

# Creating VPC,name, CIDR and Tags
resource "aws_vpc" "VPC-1" {
  cidr_block = "10.0.0.0/18"

  tags = {
    Name = "VPC-1"
  }
}

# Creating Public Subnets in VPC
resource "aws_subnet" "public_subnets-1" {
  vpc_id                  = aws_vpc.VPC-1.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "public_subnets-1"
  }
}
# Creating Private Subnets in VPC
resource "aws_subnet" "private_subnets-1" {
  vpc_id                  = aws_vpc.VPC-1.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "private_subnets-1"
  }
}

# Creating Internet Gateway in AWS VPC
resource "aws_internet_gateway" "IGW-1" {
  vpc_id = aws_vpc.VPC-1.id

  tags = {
    Name = "IGW-1"
  }
}

# Creating Route Tables for Internet gateway
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.VPC-1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW-1.id
  }

  tags = {
    Name = "public route table"
  }
}

# Creating Route Associations public subnets
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnets-1.id
  route_table_id = aws_route_table.public_rt.id
}
