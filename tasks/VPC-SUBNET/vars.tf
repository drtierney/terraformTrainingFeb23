variable "region" {
  default = "eu-west-1"
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "tag_environment" {
  type    = string
  default = "dev"
}

variable "cidr_block" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "public_subnets" {
  type = list(any)
}

variable "subnet_prefix" {
  type = string
}
