resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
    Env  = var.tag_environment
  }
}

resource "aws_subnet" "subnets" {
  count = length(var.public_subnets)

  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnets[count.index]
  tags = {
    Name        = format("%s-%d", var.subnet_prefix, count.index + 1)
    Environment = var.tag_environment
  }
}
