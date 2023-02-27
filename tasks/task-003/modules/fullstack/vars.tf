variable "prefix" {
  default = "test"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "subnet_count" {
  default = 1
}


variable "ami_id" {
  default = "ami-06e0ce9d3339cb039"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vm_count_per_subnet" {
  default = 1
}
