
resource "aws_route_table" "public" {
  vpc_id = "vpc-0e1b0cb35f5adaada"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0c62181a84f48eec2"
  }

  tags = {
    Name = "linux-patching-rtb-public"
  }
}

resource "aws_route_table" "private2" {
  vpc_id = "vpc-0e1b0cb35f5adaada"

  tags = {
    Name = "linux-patching-rtb-private2-ap-south-2a"
  }
}

resource "aws_route_table" "private1" {
  vpc_id = "vpc-0e1b0cb35f5adaada"

  tags = {
    Name = "linux-patching-rtb-private1-ap-south-2a"
  }
}

resource "aws_route_table" "main" {
  vpc_id = "vpc-0e1b0cb35f5adaada"
}
