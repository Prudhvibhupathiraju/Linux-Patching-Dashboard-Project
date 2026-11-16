
resource "aws_db_instance" "patching_db" {
  identifier     = "database-1"
  engine         = "mysql"
  engine_version = "8.4.11"
  instance_class = "db.t4g.micro"

  allocated_storage = 20
  storage_type      = "gp2"
  storage_encrypted = true
  copy_tags_to_snapshot = true
  max_allocated_storage = 1000
  apply_immediately     = false

  username = "admin"

  db_subnet_group_name = aws_db_subnet_group.patching_db.name

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id,
    aws_security_group.backend_sg.id
  ]

  backup_retention_period    = 1
  auto_minor_version_upgrade = true

  multi_az            = false
  publicly_accessible = false

  skip_final_snapshot = true

  lifecycle {
    prevent_destroy = true
  }
}
