terraform {
  required_version = "1.6.6"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.36.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}


variable "bucket_name" {
  description = "The name of the bucket"
  default     = "-example"
}

# resource "aws_s3_bucket" "terratest_bucket" {
#   bucket = "terratest${var.bucket_name}"
#   versioning {
#     enabled = true
#   }
# }
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}

output "bucket_id" {
  value = aws_s3_bucket.terratest_bucket.id
}