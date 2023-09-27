
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  tags   = var.tags
}

#variable "aws_region" {
#  default = "us-west-2"
#}


# Example output block in the Terraform code (main.tf or outputs.tf) of s3_clean and s3_landing:
output "bucket_name" {
  value = aws_s3_bucket.bucket.id
  description = "The name of the created S3 bucket."
}

