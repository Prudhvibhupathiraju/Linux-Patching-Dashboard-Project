data "aws_caller_identity" "current" {}


data "aws_vpcs" "existing" {}

data "aws_subnets" "existing" {}

data "aws_instances" "existing" {}

data "aws_instance" "backend" {
  instance_id = "i-08d88a139a0c6a153"
}

data "aws_instance" "frontend" {
  instance_id = "i-0c64bc247efd79858"
}

data "aws_security_group" "frontend_sg" {
  id = "sg-043010567ae27fa77"
}

data "aws_security_group" "backend_sg" {
  id = "sg-0482a5d655155d3f2"
}

data "aws_vpc_security_group_rules" "frontend_rules" {
  filter {
    name   = "group-id"
    values = ["sg-043010567ae27fa77"]
  }
}

data "aws_vpc_security_group_rules" "backend_rules" {
  filter {
    name   = "group-id"
    values = ["sg-0482a5d655155d3f2"]
  }
}

data "aws_vpc_security_group_rule" "frontend_rule_1" {
  security_group_rule_id = "sgr-0d30c1fd46b7b45e7"
}

data "aws_vpc_security_group_rule" "frontend_rule_2" {
  security_group_rule_id = "sgr-0155c8e807935b327"
}

data "aws_vpc_security_group_rule" "frontend_rule_3" {
  security_group_rule_id = "sgr-05e7fec698f56ed65"
}

data "aws_vpc_security_group_rule" "backend_rule_1" {
  security_group_rule_id = "sgr-065da8def00383c75"
}

data "aws_vpc_security_group_rule" "backend_rule_2" {
  security_group_rule_id = "sgr-0e54cf5cb9b7531fe"
}

data "aws_vpc_security_group_rule" "backend_rule_3" {
  security_group_rule_id = "sgr-04e69579c4c4ebce7"
}

data "aws_vpc_security_group_rule" "backend_rule_4" {
  security_group_rule_id = "sgr-07d5efb8081fc1409"
}

data "aws_vpc_security_group_rule" "backend_rule_5" {
  security_group_rule_id = "sgr-00affce48fe3cae6f"
}

data "aws_db_instance" "patching_db" {
  db_instance_identifier = "database-1"
}


data "aws_security_group" "rds_sg" {
  id = "sg-0048ba015ae1a00ee"
}

data "aws_vpc_security_group_rules" "rds_default_rules" {
  filter {
    name   = "group-id"
    values = ["sg-0048ba015ae1a00ee"]
  }
}


data "aws_vpc_security_group_rule" "rds_default_rule_1" {
  security_group_rule_id = "sgr-01cd8202cb5a1b752"
}

data "aws_vpc_security_group_rule" "rds_default_rule_2" {
  security_group_rule_id = "sgr-040bbc13dd560c506"
}

data "aws_vpc" "patching_vpc" {
  id = "vpc-0e1b0cb35f5adaada"
}

data "aws_subnet" "existing" {
  for_each = toset([
    "subnet-0bcce8d7f8928bb1b",
    "subnet-0744f91d5af186d96",
    "subnet-0b5d78e089bac3f8e",
    "subnet-0947f6bcf56887471",
    "subnet-068adf84202194d8d",
    "subnet-03f7151d7f2991fc6",
    "subnet-032ac9f8d59ab39a8"
  ])

  id = each.value
}

data "aws_route_tables" "patching_vpc" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.patching_vpc.id]
  }
}

data "aws_route_table" "patching_vpc" {
  for_each = toset(data.aws_route_tables.patching_vpc.ids)

  route_table_id = each.value
}

data "aws_internet_gateway" "patching_vpc" {
  internet_gateway_id = "igw-0c62181a84f48eec2"
}

data "aws_nat_gateways" "patching_vpc" {
  vpc_id = data.aws_vpc.patching_vpc.id
}

data "aws_network_acls" "patching_vpc" {
  vpc_id = data.aws_vpc.patching_vpc.id
}

data "aws_network_acls" "patching_acl" {
  vpc_id = data.aws_vpc.patching_vpc.id

  filter {
    name   = "network-acl-id"
    values = ["acl-08a8c35da8eb59cb4"]
  }
}

data "aws_db_subnet_group" "patching_db" {
  name = "linux-patching-db-subnet-group"
}