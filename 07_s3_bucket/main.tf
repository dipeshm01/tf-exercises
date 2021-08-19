provider "aws" {
  region = "eu-west-1"
}

locals {
  bucket_name = "${terrarform.workspace}-s3-bucket"
}

resource "aws_s3_bucket" "test-buck" {
  bucket = var.bucket
  acl    = "private"

  tags = {
    Name        = local.bucket_name
    Environment = "Dev"
  }
}
