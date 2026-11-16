
resource "aws_instance" "frontend" {
  ami                         = "ami-0ed819c9d1237d1f2"
  instance_type               = "t3.small"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = ["sg-043010567ae27fa77"]
  key_name                    = "linux-patching-key-pair"
  associate_public_ip_address = true

  private_ip = "10.0.14.200"

  monitoring              = false
  ebs_optimized           = true
  source_dest_check       = true
  disable_api_stop        = false
  disable_api_termination = false

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = 8
    volume_type           = "gp3"
    iops                  = 3000
    throughput            = 125
  }

  tags = {
    Name = "linux-patching-frontend"
  }
}

resource "aws_instance" "backend" {
  ami                         = "ami-0ed819c9d1237d1f2"
  instance_type               = "t3.small"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = ["sg-0482a5d655155d3f2"]
  key_name                    = "linux-patching-key-pair"
  associate_public_ip_address = true

  private_ip = "10.0.2.42"

  monitoring              = false
  ebs_optimized           = true
  source_dest_check       = true
  disable_api_stop        = false
  disable_api_termination = false

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = 8
    volume_type           = "gp3"
    iops                  = 3000
    throughput            = 125
  }

  tags = {
    Name = "linux-patching-backend"
  }
}
