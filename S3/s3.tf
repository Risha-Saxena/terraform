provider "aws" {
 
  region = "us-east-1"
  access_key = "AKIAYOGFPWPIUW7EEM5Y"
  secret_key = "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"
}

resource "aws_s3_bucket" "tf-remote-state-01" {
  bucket = "tf-remote-state-01" 

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}