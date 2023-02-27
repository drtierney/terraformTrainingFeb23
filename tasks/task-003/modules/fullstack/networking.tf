resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = format("%s-vpc", var.prefix)
  }
}

locals {
  cidr_block_base = split("/", aws_vpc.vpc.cidr_block)[0]
  octets = split(".", local.cidr_block_base)
}

resource "aws_subnet" "subnet" {
    count = var.subnet_count
    vpc_id = aws_vpc.vpc.id
    cidr_block = format("%d.%d.%d.0/24", local.octets[0], local.octets[1], parseint(local.octets[2], 10) + (count.index + 1))
    tags = {
      "Name" = format("%s-subnet-%d", var.prefix, count.index + 1)
    }
}
