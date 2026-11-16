
resource "aws_default_network_acl" "patching_acl" {
  default_network_acl_id = "acl-08a8c35da8eb59cb4"

  subnet_ids = [
    aws_subnet.public.id,
    aws_subnet.private_1.id,
    aws_subnet.private_2.id,
    aws_subnet.private_3.id
  ]

  ingress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {}
}
