provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "b" {
  for_each = var.bucket_names
  bucket = each.value
  acl    = "private"

  tags = {
    Name        = each.value
    Environment = "Dev"
  }
}

/*
resource "aws_s3_bucket_policy" "b" {
  for_each = aws_s3_bucket.b
  bucket = [value.id]

  # Terraform's "jsonencode" function converts a
  # Terraform expression's result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "MYBUCKETPOLICY"
    Statement = [
      {
        Sid       = "IPAllow"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = []
        Condition = {
          IpAddress = {
            "aws:SourceIp" = "8.8.8.8/32"
          }
        }
      },
    ]
  })
}
*/

variable "bucket_names" {
  description = "Create buckets with these names"
  type        = set(string)
  default     = ["xyza-bucket-1", "xyzt-bucket-two", "xyzn-3rd-bucket"]
}

output "bucket_id" {
  value = [ for bucket in aws_s3_bucket.b: bucket.id]
  description = "bucket id"
}

output "bucket_arn" {
  value = [ for bucket in aws_s3_bucket.b: bucket.arn]
  description = "bucket arn"
}
