
resource "aws_db_subnet_group" "patching_db" {
  name        = "linux-patching-db-subnet-group"
  description = "Private subnet group for Linux patching dashboard"

  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]

  tags = {}

  lifecycle {
    prevent_destroy = true
  }
}
