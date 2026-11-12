output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_user_arn" {
  value = data.aws_caller_identity.current.arn
}

output "existing_vpcs" {
  value = data.aws_vpcs.existing.ids
}

output "existing_subnets" {
  value = data.aws_subnets.existing.ids
}

output "existing_ec2_instances" {
  value = data.aws_instances.existing.ids
}

output "backend_details" {
  value = {
    instance_id   = data.aws_instance.backend.id
    instance_type = data.aws_instance.backend.instance_type
    private_ip    = data.aws_instance.backend.private_ip
    public_ip     = data.aws_instance.backend.public_ip
    subnet_id     = data.aws_instance.backend.subnet_id
    state         = data.aws_instance.backend.instance_state
    tags          = data.aws_instance.backend.tags
  }
}

output "frontend_details" {
  value = {
    instance_id   = data.aws_instance.frontend.id
    instance_type = data.aws_instance.frontend.instance_type
    private_ip    = data.aws_instance.frontend.private_ip
    public_ip     = data.aws_instance.frontend.public_ip
    subnet_id     = data.aws_instance.frontend.subnet_id
    state         = data.aws_instance.frontend.instance_state
    tags          = data.aws_instance.frontend.tags
  }
}

output "frontend_security_groups" {
  value = data.aws_instance.frontend.vpc_security_group_ids
}

output "backend_security_groups" {
  value = data.aws_instance.backend.vpc_security_group_ids
}

output "frontend_sg_details" {
  value = {
    id          = data.aws_security_group.frontend_sg.id
    name        = data.aws_security_group.frontend_sg.name
    description = data.aws_security_group.frontend_sg.description
    vpc_id      = data.aws_security_group.frontend_sg.vpc_id
  }
}

output "backend_sg_details" {
  value = {
    id          = data.aws_security_group.backend_sg.id
    name        = data.aws_security_group.backend_sg.name
    description = data.aws_security_group.backend_sg.description
    vpc_id      = data.aws_security_group.backend_sg.vpc_id
  }
}

output "frontend_security_group_rule_ids" {
  value = data.aws_vpc_security_group_rules.frontend_rules.ids
}

output "backend_security_group_rule_ids" {
  value = data.aws_vpc_security_group_rules.backend_rules.ids
}

output "frontend_rule_details" {
  value = {
    rule_1 = {
      id          = data.aws_vpc_security_group_rule.frontend_rule_1.id
      direction   = data.aws_vpc_security_group_rule.frontend_rule_1.is_egress
      protocol    = data.aws_vpc_security_group_rule.frontend_rule_1.ip_protocol
      from_port   = data.aws_vpc_security_group_rule.frontend_rule_1.from_port
      to_port     = data.aws_vpc_security_group_rule.frontend_rule_1.to_port
      cidr_ipv4   = data.aws_vpc_security_group_rule.frontend_rule_1.cidr_ipv4
      description = data.aws_vpc_security_group_rule.frontend_rule_1.description
    }

    rule_2 = {
      id          = data.aws_vpc_security_group_rule.frontend_rule_2.id
      direction   = data.aws_vpc_security_group_rule.frontend_rule_2.is_egress
      protocol    = data.aws_vpc_security_group_rule.frontend_rule_2.ip_protocol
      from_port   = data.aws_vpc_security_group_rule.frontend_rule_2.from_port
      to_port     = data.aws_vpc_security_group_rule.frontend_rule_2.to_port
      cidr_ipv4   = data.aws_vpc_security_group_rule.frontend_rule_2.cidr_ipv4
      description = data.aws_vpc_security_group_rule.frontend_rule_2.description
    }

    rule_3 = {
      id          = data.aws_vpc_security_group_rule.frontend_rule_3.id
      direction   = data.aws_vpc_security_group_rule.frontend_rule_3.is_egress
      protocol    = data.aws_vpc_security_group_rule.frontend_rule_3.ip_protocol
      from_port   = data.aws_vpc_security_group_rule.frontend_rule_3.from_port
      to_port     = data.aws_vpc_security_group_rule.frontend_rule_3.to_port
      cidr_ipv4   = data.aws_vpc_security_group_rule.frontend_rule_3.cidr_ipv4
      description = data.aws_vpc_security_group_rule.frontend_rule_3.description
    }
  }
}


output "backend_rule_details" {
  value = {
    rule_1 = {
      id                           = data.aws_vpc_security_group_rule.backend_rule_1.id
      is_egress                    = data.aws_vpc_security_group_rule.backend_rule_1.is_egress
      protocol                     = data.aws_vpc_security_group_rule.backend_rule_1.ip_protocol
      from_port                    = data.aws_vpc_security_group_rule.backend_rule_1.from_port
      to_port                      = data.aws_vpc_security_group_rule.backend_rule_1.to_port
      cidr_ipv4                    = data.aws_vpc_security_group_rule.backend_rule_1.cidr_ipv4
      cidr_ipv6                    = data.aws_vpc_security_group_rule.backend_rule_1.cidr_ipv6
      referenced_security_group_id = data.aws_vpc_security_group_rule.backend_rule_1.referenced_security_group_id
      description                  = data.aws_vpc_security_group_rule.backend_rule_1.description
    }

    rule_2 = {
      id                           = data.aws_vpc_security_group_rule.backend_rule_2.id
      is_egress                    = data.aws_vpc_security_group_rule.backend_rule_2.is_egress
      protocol                     = data.aws_vpc_security_group_rule.backend_rule_2.ip_protocol
      from_port                    = data.aws_vpc_security_group_rule.backend_rule_2.from_port
      to_port                      = data.aws_vpc_security_group_rule.backend_rule_2.to_port
      cidr_ipv4                    = data.aws_vpc_security_group_rule.backend_rule_2.cidr_ipv4
      cidr_ipv6                    = data.aws_vpc_security_group_rule.backend_rule_2.cidr_ipv6
      referenced_security_group_id = data.aws_vpc_security_group_rule.backend_rule_2.referenced_security_group_id
      description                  = data.aws_vpc_security_group_rule.backend_rule_2.description
    }

    rule_3 = {
      id                           = data.aws_vpc_security_group_rule.backend_rule_3.id
      is_egress                    = data.aws_vpc_security_group_rule.backend_rule_3.is_egress
      protocol                     = data.aws_vpc_security_group_rule.backend_rule_3.ip_protocol
      from_port                    = data.aws_vpc_security_group_rule.backend_rule_3.from_port
      to_port                      = data.aws_vpc_security_group_rule.backend_rule_3.to_port
      cidr_ipv4                    = data.aws_vpc_security_group_rule.backend_rule_3.cidr_ipv4
      cidr_ipv6                    = data.aws_vpc_security_group_rule.backend_rule_3.cidr_ipv6
      referenced_security_group_id = data.aws_vpc_security_group_rule.backend_rule_3.referenced_security_group_id
      description                  = data.aws_vpc_security_group_rule.backend_rule_3.description
    }

    rule_4 = {
      id                           = data.aws_vpc_security_group_rule.backend_rule_4.id
      is_egress                    = data.aws_vpc_security_group_rule.backend_rule_4.is_egress
      protocol                     = data.aws_vpc_security_group_rule.backend_rule_4.ip_protocol
      from_port                    = data.aws_vpc_security_group_rule.backend_rule_4.from_port
      to_port                      = data.aws_vpc_security_group_rule.backend_rule_4.to_port
      cidr_ipv4                    = data.aws_vpc_security_group_rule.backend_rule_4.cidr_ipv4
      cidr_ipv6                    = data.aws_vpc_security_group_rule.backend_rule_4.cidr_ipv6
      referenced_security_group_id = data.aws_vpc_security_group_rule.backend_rule_4.referenced_security_group_id
      description                  = data.aws_vpc_security_group_rule.backend_rule_4.description
    }

    rule_5 = {
      id                           = data.aws_vpc_security_group_rule.backend_rule_5.id
      is_egress                    = data.aws_vpc_security_group_rule.backend_rule_5.is_egress
      protocol                     = data.aws_vpc_security_group_rule.backend_rule_5.ip_protocol
      from_port                    = data.aws_vpc_security_group_rule.backend_rule_5.from_port
      to_port                      = data.aws_vpc_security_group_rule.backend_rule_5.to_port
      cidr_ipv4                    = data.aws_vpc_security_group_rule.backend_rule_5.cidr_ipv4
      cidr_ipv6                    = data.aws_vpc_security_group_rule.backend_rule_5.cidr_ipv6
      referenced_security_group_id = data.aws_vpc_security_group_rule.backend_rule_5.referenced_security_group_id
      description                  = data.aws_vpc_security_group_rule.backend_rule_5.description
    }
  }
}

output "rds_details" {
  value = {
    identifier          = "database-1"
    db_instance_arn     = data.aws_db_instance.patching_db.db_instance_arn
    engine              = data.aws_db_instance.patching_db.engine
    instance_class      = data.aws_db_instance.patching_db.db_instance_class
    endpoint            = data.aws_db_instance.patching_db.endpoint
    address             = data.aws_db_instance.patching_db.address
    port                = data.aws_db_instance.patching_db.db_instance_port
    db_name             = data.aws_db_instance.patching_db.db_name
    availability_zone   = data.aws_db_instance.patching_db.availability_zone
    publicly_accessible = data.aws_db_instance.patching_db.publicly_accessible
    security_groups     = data.aws_db_instance.patching_db.vpc_security_groups
    subnet_group        = data.aws_db_instance.patching_db.db_subnet_group
    storage_encrypted   = data.aws_db_instance.patching_db.storage_encrypted
  }
}


output "rds_security_group_details" {
  value = {
    id          = data.aws_security_group.rds_sg.id
    name        = data.aws_security_group.rds_sg.name
    description = data.aws_security_group.rds_sg.description
    vpc_id      = data.aws_security_group.rds_sg.vpc_id
  }
}

output "rds_default_security_group_rule_ids" {
  value = data.aws_vpc_security_group_rules.rds_default_rules.ids
}


output "rds_default_rule_details" {
  value = {
    rule_1 = {
      id                           = data.aws_vpc_security_group_rule.rds_default_rule_1.id
      is_egress                    = data.aws_vpc_security_group_rule.rds_default_rule_1.is_egress
      protocol                     = data.aws_vpc_security_group_rule.rds_default_rule_1.ip_protocol
      from_port                    = data.aws_vpc_security_group_rule.rds_default_rule_1.from_port
      to_port                      = data.aws_vpc_security_group_rule.rds_default_rule_1.to_port
      cidr_ipv4                    = data.aws_vpc_security_group_rule.rds_default_rule_1.cidr_ipv4
      cidr_ipv6                    = data.aws_vpc_security_group_rule.rds_default_rule_1.cidr_ipv6
      referenced_security_group_id = data.aws_vpc_security_group_rule.rds_default_rule_1.referenced_security_group_id
      description                  = data.aws_vpc_security_group_rule.rds_default_rule_1.description
    }

    rule_2 = {
      id                           = data.aws_vpc_security_group_rule.rds_default_rule_2.id
      is_egress                    = data.aws_vpc_security_group_rule.rds_default_rule_2.is_egress
      protocol                     = data.aws_vpc_security_group_rule.rds_default_rule_2.ip_protocol
      from_port                    = data.aws_vpc_security_group_rule.rds_default_rule_2.from_port
      to_port                      = data.aws_vpc_security_group_rule.rds_default_rule_2.to_port
      cidr_ipv4                    = data.aws_vpc_security_group_rule.rds_default_rule_2.cidr_ipv4
      cidr_ipv6                    = data.aws_vpc_security_group_rule.rds_default_rule_2.cidr_ipv6
      referenced_security_group_id = data.aws_vpc_security_group_rule.rds_default_rule_2.referenced_security_group_id
      description                  = data.aws_vpc_security_group_rule.rds_default_rule_2.description
    }
  }
}
