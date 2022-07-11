// Security group

resource "aws_security_group" "security_group" {
  description = "Allow limited external traffic"
  vpc_id = "${aws_vpc.VPC-1.id}"
  name = "security_group"

  ingress {
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
  }

  ingress {
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 8080
    to_port = 8080
  }

  ingress {
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 442
    to_port = 446
  }

  egress {
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port = 0
  }

  tags = {
    name = "security_group"
  }

}

output "aws_security_gr_id" {
  value = "${aws_security_group.security_group.id}"
}


// creating ec2 in public subnet 
resource "aws_instance" "public_intance" {
  ami = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  vpc_security_group_ids = [    "${aws_security_group.security_group.id}"   ]
  subnet_id = "${aws_subnet.public_subnets-1.id}"
  key_name = "newkey"
  count = 1
  associate_public_ip_address = true
  tags = {
    "name" = "public_intance"
  }
}
// creating ec2 in private subnet 
resource "aws_instance" "private_intance" {
  ami = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  vpc_security_group_ids = [    "${aws_security_group.security_group.id}"   ]
  subnet_id = "${aws_subnet.private_subnets-1.id}"
  key_name = "newkey"
  count = 1
  associate_public_ip_address = false
  tags = {
    "name" = "private_intance"
  }
}