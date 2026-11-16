
resource "aws_security_group" "frontend_sg" {
  name        = "linux-patching-frontend-sg"
  description = "linux-patching-frontend-sg"
  vpc_id      = aws_vpc.patching_vpc.id

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_security_group" "backend_sg" {
  name        = "linux-patching-backend-sg"
  description = "linux-patching-backend-sg"
  vpc_id      = aws_vpc.patching_vpc.id

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "default"
  description = "default VPC security group"
  vpc_id      = aws_vpc.patching_vpc.id

  lifecycle {
    prevent_destroy = true
  }
}
