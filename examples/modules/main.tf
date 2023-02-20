module "ec2-finance" {
  source = "./finance/ec2"

  vm-name         = "dt-vm-fin01"
  tag-environment = "Dev"
}

module "ec2-hr" {
  source = "./hr/ec2"

  ami             = "ami-06e0ce9d3339cb039"
  instance-type   = "t3.micro"
  vm-name         = "dt-vm-hr01"
  tag-environment = "Dev"
  num_of_vm       = 2
}
