resource "aws_s3_bucket" "b" {
  count = length(var.bucket-names)
  bucket = var.bucket-names[count.index]
  tags = {
    "id" = "dev-${var.bucket-names[count.index]}"
  }
}

resource "aws_s3_bucket_policy" "b" {
  //bucket = aws_s3_bucket.b.id
  count = length(var.bucket-names)
  bucket = aws_s3_bucket.b[count.index].id
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

