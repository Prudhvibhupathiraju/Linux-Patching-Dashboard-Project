
# Frontend: Allow HTTP traffic from anywhere
resource "aws_vpc_security_group_ingress_rule" "frontend_http" {
  security_group_id = aws_security_group.frontend_sg.id
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_ipv4         = "0.0.0.0/0"
}

# Frontend: Existing SSH access
resource "aws_vpc_security_group_ingress_rule" "frontend_ssh" {
  security_group_id = aws_security_group.frontend_sg.id
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = "0.0.0.0/0"
}

# Frontend: Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "frontend_all_outbound" {
  security_group_id = aws_security_group.frontend_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}


# Backend: SSH access from approved IP
resource "aws_vpc_security_group_ingress_rule" "backend_ssh" {
  security_group_id = aws_security_group.backend_sg.id
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = "43.227.128.20/32"
}

# Backend: MySQL access from the same security group
resource "aws_vpc_security_group_ingress_rule" "backend_mysql" {
  security_group_id            = aws_security_group.backend_sg.id
  ip_protocol                  = "tcp"
  from_port                    = 3306
  to_port                      = 3306
  referenced_security_group_id = aws_security_group.backend_sg.id
}

# Backend: API access from frontend
resource "aws_vpc_security_group_ingress_rule" "backend_api_frontend" {
  security_group_id            = aws_security_group.backend_sg.id
  ip_protocol                  = "tcp"
  from_port                    = 5000
  to_port                      = 5000
  referenced_security_group_id = aws_security_group.frontend_sg.id
}

# Backend: Existing public API testing access
resource "aws_vpc_security_group_ingress_rule" "backend_api_public" {
  security_group_id = aws_security_group.backend_sg.id
  description       = "Dashboard API testing"
  ip_protocol       = "tcp"
  from_port         = 5000
  to_port           = 5000
  cidr_ipv4         = "0.0.0.0/0"
}

# Backend: Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "backend_all_outbound" {
  security_group_id = aws_security_group.backend_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}


# RDS: Allow traffic from resources using the same security group
resource "aws_vpc_security_group_ingress_rule" "rds_self" {
  security_group_id            = aws_security_group.rds_sg.id
  ip_protocol                  = "-1"
  referenced_security_group_id = aws_security_group.rds_sg.id
}

# RDS: Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "rds_all_outbound" {
  security_group_id = aws_security_group.rds_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}
