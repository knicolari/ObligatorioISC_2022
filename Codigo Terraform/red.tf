resource "aws_vpc" "eks-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "eks-vpc"
  }
  enable_dns_hostnames = true
  enable_dns_support = true

}

resource "aws_subnet" "eks-subnet1" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = var.subnet
  availability_zone = var.az1
  map_public_ip_on_launch = "true"
  tags = {
    Name = "eks-subnet1"
  }
}

resource "aws_subnet" "eks-subnet2" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = var.subnet-2
  availability_zone = var.az2
  map_public_ip_on_launch = "true"  
  tags = {
    Name = "eks-subnet2"
  }
}

resource "aws_security_group" "eks_sg" {
  name        = "eks_sg"
  description = "eks control de trafico"
  vpc_id      = aws_vpc.eks-vpc.id


  ingress {
    description      = "hhtp"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }
  
   ingress {
    description      = "hhtps"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }
  
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

}

resource "aws_internet_gateway" "eks-gw" {
  vpc_id = aws_vpc.eks-vpc.id
  tags = {
    Name = "eks-gw"
  }
}

resource "aws_route_table" "eks-route-table" {
  vpc_id =  aws_vpc.eks-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-gw.id
  }
  tags = {
    Name = "eks default route table"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.eks-subnet1.id
  route_table_id = aws_route_table.eks-route-table.id
  
}

resource "aws_route_table_association" "b" {
  subnet_id = aws_subnet.eks-subnet2.id
  route_table_id = aws_route_table.eks-route-table.id
}
