#Scenario: Generate a dynamic IAM policy in Terraform using jsonencode.
variable "bucket_names" {
  type    = list(string)
  default = ["bucket1", "bucket2"]
}

resource "aws_iam_policy" "s3_policy" {
  name   = "dynamic-s3-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      for bucket in var.bucket_names : {
        Action   = ["s3:GetObject", "s3:ListBucket"]
        Effect   = "Allow"
        Resource = ["arn:aws:s3:::${bucket}", "arn:aws:s3:::${bucket}/*"]
      }
    ]
  })
}
#Key Concepts: JSON encoding, dynamic policy generation, iteration with loops.
