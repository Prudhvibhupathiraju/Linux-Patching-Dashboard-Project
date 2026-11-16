resource "aws_subnet" "public" {
  vpc_id                  = "vpc-0e1b0cb35f5adaada"
  cidr_block              = "10.0.0.0/20"
  availability_zone       = "ap-south-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "linux-patching-subnet-public1-ap-south-2a"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id                  = "vpc-0e1b0cb35f5adaada"
  cidr_block              = "10.0.16.0/20"
  availability_zone       = "ap-south-2b"
  map_public_ip_on_launch = false
  tags = {
    Name = "linux-patching-subnet-private3-ap-south-2b"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id                  = "vpc-0e1b0cb35f5adaada"
  cidr_block              = "10.0.128.0/20"
  availability_zone       = "ap-south-2a"
  map_public_ip_on_launch = false
  tags = {
    Name = "linux-patching-subnet-private1-ap-south-2a"
  }
}

resource "aws_subnet" "private_3" {
  vpc_id                  = "vpc-0e1b0cb35f5adaada"
  cidr_block              = "10.0.144.0/20"
  availability_zone       = "ap-south-2a"
  map_public_ip_on_launch = false
  tags = {
    Name = "linux-patching-subnet-private2-ap-south-2a"
  }

}