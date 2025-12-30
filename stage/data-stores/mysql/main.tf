
terraform {
  backend "s3" {
    bucket = "bucket-versioning-tfstate-running"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-up-and-run-running-locks"
    encrypt = true
    
  }
}

provider "aws" {
    region = "eu-central-1"
  
}

resource "aws_db_instance" "example" {
    identifier_prefix = "terraform-up-and-running"
    engine = "mysql"
    allocated_storage = 10
    instance_class = "db.t3.micro"
    skip_final_snapshot = true
    db_name = "example_database"

    username = var.db_username
    password = var.db_password
  
}
