terraform {
    backend  "s3" {
    region         = "us-east-1"
    bucket         = "tf-remote-state-01"
    key            = "terraform.tfstate" 
    access_key = "AKIAYOGFPWPIUW7EEM5Y"
    secret_key = "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"
    }

    required_providers {
      aws = {
        version = " ~> 3.0"
        source = "registry.terraform.io/hashicorp/aws"
      }
    }

} 

