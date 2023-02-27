variable "region" {
  default = "eu-west-1"
}

variable "ami_id" {
  default = "ami-06e0ce9d3339cb039"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "tag_name" {
  default = "dt-vm"
}

variable "tag_environment" {
  default = "test"
}
