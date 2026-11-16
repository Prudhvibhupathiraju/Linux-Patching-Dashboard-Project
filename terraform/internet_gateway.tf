resource "aws_internet_gateway" "patching_igw" {
  vpc_id = aws_vpc.patching_vpc.id

  tags = {
    Name = "linux-patching-igw"
  }
}