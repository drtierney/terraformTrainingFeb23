resource "aws_instance" "vm" {
  count = var.num_of_vm

  ami           = var.ami
  instance_type = var.instance-type
  tags = {
    Name        = var.vm-name
    Environment = var.tag-environment
    Department  = "HR"
    Contact     = "Bob"
  }
}
