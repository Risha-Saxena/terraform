provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    region         = "us-east-1"
    bucket         = "tf-state-blog-01"
    key            = "terraform.tfstate"
    encrypt        = "true"
  }
}

locals {
  azs = ["us-east-1a", "us-east-1b"]
  environment            = "dev"
  

tags = {
    terraform   = true
  }
}


