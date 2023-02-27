resource "aws_instance" "name" {
  count = length(aws_subnet.subnet.*.id) * var.vm_count_per_subnet

  ami = var.ami_id
  instance_type = var.instance_type

  subnet_id = aws_subnet.subnet.*.id[count.index % length(aws_subnet.subnet.*.id)]
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = format("%s-vm-%d", var.prefix, count.index)
  }
}
