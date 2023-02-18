variable "region" {
  default = "eu-west-1"
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "ami_id" {
  description = "the ami_id for the AWS EC2 Instance - the default is the current AWS Linux AMI for the eu-west-1 region"
  default     = "ami-06e0ce9d3339cb039"
}

variable "instance_type" {
}

variable "tag_name" {
  default = "dt-vm"
}

variable "tag_environment" {
  type    = string
  default = "dev"
}
