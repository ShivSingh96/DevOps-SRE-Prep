#Scenario: Write a Terraform module to create multiple S3 buckets with different lifecycle policies. Use a map to dynamically create configurations.
#Solution: Module (modules/s3/main.tf):
variable "buckets" {
  type = map(object({
    lifecycle_rule = object({
      prefix  = string
      enabled = bool
    })
  }))
}

resource "aws_s3_bucket" "bucket" {
  for_each = var.buckets
  bucket   = each.key

  lifecycle_rule {
    id      = "lifecycle"
    prefix  = each.value.lifecycle_rule.prefix
    enabled = each.value.lifecycle_rule.enabled
  }
}
#Main Configuration (main.tf):
module "s3_buckets" {
  source = "./modules/s3"
  buckets = {
    "bucket-one" = { lifecycle_rule = { prefix = "logs/", enabled = true } }
    "bucket-two" = { lifecycle_rule = { prefix = "temp/", enabled = false } }
  }
}
#Key Concepts: Dynamic blocks, maps, reusability.
