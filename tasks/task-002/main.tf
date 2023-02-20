locals {
  owner      = "david"
  department = "IT"
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["dt-vpc-01"]
  }
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

resource "aws_instance" "vm" {
  count = var.create_vm ? length(data.aws_subnets.subnets.ids) : 0

  ami                    = var.ami_id[var.region]
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnets.subnets.ids[count.index]
  vpc_security_group_ids = [aws_security_group.dt-sg-01.id]
  tags = {
    Name        = format("%s-vm00%d", var.tag_name, count.index + 1)
    Environment = var.tag_environment
    Contact     = local.owner
  }

  depends_on = [
    aws_security_group.dt-sg-01
  ]
}

resource "aws_security_group" "dt-sg-01" {
  name        = "dt-sg-01"
  description = "Allow SSH and ICMP inbound and All outbound"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    description = "SSH from within VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.vpc.cidr_block]
  }

  ingress {
    description = "ICMP from within VPC"
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = [data.aws_vpc.vpc.cidr_block]
  }

  egress {
    description      = "Allow all traffic outbound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "dt-sg-01"
  }
}
