#Question: You have an S3 bucket for Terraform state storage. Write a configuration to store the state remotely with locking enabled using DynamoDB.

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "env/prod/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
#Key Concepts: Remote state, S3 backend, state locking with DynamoDB.
