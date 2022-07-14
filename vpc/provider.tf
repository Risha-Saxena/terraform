provider "aws" {
  region = "us-east-1"
  secret_key = "${ secrets.ACCESS_KEY }"
  access_key = "${ secrets.SECRET_KEY }"
}
terraform {
  cloud {
    organization = "Scaleworx-1"

    workspaces {
      name = "terraform-workspace"
    }
  }
}
locals {
  azs = ["us-east-1a", "us-east-1b"]
  environment            = "production"
  

tags = {
    terraform   = true
  }
}


