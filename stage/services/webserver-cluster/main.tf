terraform {
  backend "s3" {
    bucket = "bucket-versioning-tfstate-running"
    key = "services/webserver-cluster/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-up-and-run-running-locks"
    encrypt = true
    
  }
}



provider "aws" {
    region = "eu-central-1"
  
}

module "webserver_cluster" {
    source = "../../../modules/services/webserver-cluster"
  
}