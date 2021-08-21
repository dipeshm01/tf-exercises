provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "b" {
  for_each = var.bucket_names
  //count = length(var.bucket_names)
  //bucket = var.bucket_names[count.index]
  bucket = each.value
  acl    = "private"

  tags = {
    Name        = var.bucket_names[count.index]
    Environment = "Dev"
  }
}

variable "bucket_names" {
  description = "Create buckets with these names"
  type        = list(string)
  default     = ["masdfa-bucket-1", "mdfsfas-bucket-two", "mxyzn-3rd-bucket-fdsafdsa"]
}

output "bucket_1_id" {
  value       = aws_s3_bucket.b[0].id
  description = "The ARN for 1st bucket"
}

output "all_arns" {
  value       = aws_s3_bucket.b[*].arn
  description = "The ARNs for all users"
}


resource "aws_s3_bucket_policy" "b" {
  count = 3
  bucket = aws_s3_bucket.b[count.index].id
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
        Resource = [
          aws_s3_bucket.b[count.index].arn,
          "${aws_s3_bucket.b[count.index].arn}/*",
        ]
        Condition = {
          IpAddress = {
            "aws:SourceIp" = "8.8.8.8/32"
          }
        }
      },
    ]
  })
}

