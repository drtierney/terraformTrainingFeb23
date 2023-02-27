terraform {
  cloud {
    organization = "drtierney"

    workspaces {
      name = "task-004"
    }
  }
}

provider "aws" {
  profile = "default"
}