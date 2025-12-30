resource "aws_dynamodb_table" "terraform_locks" {

    name = "terraform-up-and-run-running-locks"
    billing_mode = "PAY-PER-REQUEST"
    hash_key = "LockID"
    attribute {
      name = "LockID"
      type = "S"
    }
  
}