

terraform {
  backend "s3" {
    bucket = "bucket-versioning-tfstate-running"
    key = "global/s3/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-up-and-run-running-locks"
    encrypt = true
    
  }
}






provider "aws" {
    region = "eu-central-1"
  
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "bucket-versioning-tfstate-running"

    lifecycle {
      prevent_destroy = true
    }
  
}



resource "aws_s3_bucket_versioning" "enabled" {
    bucket = aws_s3_bucket.my_bucket.id
    versioning_configuration {
      status = "Enabled"
    }
  
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encrypt" {
    bucket = aws_s3_bucket.my_bucket.id

    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  
}
