resource "aws_instance" "vm" {
  count = 2

  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.tag_name
    Env  = var.tag_environment
  }
}