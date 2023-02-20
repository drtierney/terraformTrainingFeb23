output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_id_list" {
  value = aws_subnet.subnets.*.id
}

output "subnet_cidr_list" {
  value = aws_subnet.subnets.*.cidr_block
}
