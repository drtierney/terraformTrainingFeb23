resource "aws_security_group" "sg" {
  name        = format("%s-sg", var.prefix)
  description = "Allow SSH and ICMP inbound and All outbound"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH from within VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  ingress {
    description = "ICMP from within VPC"
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
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
    Name = format("%s-sg", var.prefix)
  }
}
