# provider "aws" {
#   region = "us-east-1"
#   access_key = "AKIA4XOTK3EFH4LS4ZGA"
#   secret_key = "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"  
# }

// elastic ip
resource "aws_eip" "nat_eip-1" {
  vpc      = true
  depends_on = [aws_internet_gateway.IGW-1]
  tags = {
    "name" = "nat_eip-1"
  }
}
// nat-gateway 
resource "aws_nat_gateway" "NATgw-1" {
  allocation_id = aws_eip.nat_eip-1.id
  subnet_id     = aws_subnet.private_subnets-1.id
  depends_on = [aws_internet_gateway.IGW-1]

  tags = {
    Name = "NATgw-1"
  } 
} 
 
 //Route table for Private Subnet's
 resource "aws_route_table" "Private_rt" {    
   vpc_id = aws_vpc.VPC-1.id

   route {
    cidr_block = "0.0.0.0/0"             
    gateway_id = aws_nat_gateway.NATgw-1.id
   }

   tags = {
     "name" = "Private_rt"
   }
 }
 //Route table Association with Private Subnet's
 resource "aws_route_table_association" "PrivateRTassociation" {
    subnet_id = aws_subnet.private_subnets-1.id
    route_table_id = aws_route_table.Private_rt.id
 }
 