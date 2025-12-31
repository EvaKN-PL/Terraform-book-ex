
terraform {
  backend "s3" {
    bucket = "bucket-versioning-tfstate-running"
    key = "stage/services/webserver-cluster/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-up-and-run-running-locks"
    encrypt = true
    
  }
}

resource "aws_instance" "example" {
    ami = "ami-015f3aa67b494b27e"
    instance_type = "t2.micro"
  
}
