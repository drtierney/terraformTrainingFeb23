variable "region" {
  default = "us-east-1"
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "ami_id" {
  type = map(any)
  default = {
    "eu-west-1" = "ami-06e0ce9d3339cb039"
    "us-east-1" = "ami-0aa7d40eeae50c9a9"
  }
}

variable "instance_type" {
  type = string
}

variable "tag_name" {
  type = string
}

variable "tag_environment" {
  type    = string
  default = "test"
}

variable "create_vm" {
  type    = bool
  default = false
}
