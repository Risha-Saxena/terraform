provider "aws" {
  region = "us-east-1"
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


