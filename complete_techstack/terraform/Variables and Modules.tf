#Question: Create a reusable module for creating an S3 bucket and use it in the main Terraform file.
#Module (modules/s3/main.tf):
variable "bucket_name" {}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"
}
#Main file (main.tf):
module "my_s3_bucket" {
  source      = "./modules/s3"
  bucket_name = "my-unique-bucket-name"
}
#Key Concepts: Modules, variables, reusability.
