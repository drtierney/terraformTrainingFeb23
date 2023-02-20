resource "aws_instance" "vm" {
  ami           = "ami-06e0ce9d3339cb039"
  instance_type = "t2.micro"
  tags = {
    Name        = var.vm-name
    Environment = var.tag-environment
    Department  = "FINANCE"
    Contact     = "David"
  }
}
