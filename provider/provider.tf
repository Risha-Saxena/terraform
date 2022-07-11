provider "aws" {
  region = "us-east-1"
  access_key = "AKIAYOGFPWPIUW7EEM5Y"
  secret_key = "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"  
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


