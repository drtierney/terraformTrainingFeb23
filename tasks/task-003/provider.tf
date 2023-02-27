terraform {
  backend "s3" {
    bucket  = "drtierney-terraform-states"
    key     = "task-003.tfstate"
    region  = "eu-west-1"
    profile = "default"
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}
