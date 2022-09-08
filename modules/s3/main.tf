# tfsec:ignore:aws-s3-enable-bucket-logging tfsec:ignore:aws-s3-enable-versioning
resource "aws_s3_bucket" "test_bucket" {
  bucket = var.bucket_name
}

# resource "aws_s3_bucket_public_access_block" "test_bucket" {
#   bucket                  = aws_s3_bucket.test_bucket.id
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
#   block_public_acls       = true
# }

# resource "aws_kms_key" "test" {
#   enable_key_rotation = true
# }

# resource "aws_s3_bucket_server_side_encryption_configuration" "test_bucket" {
#   bucket = aws_s3_bucket.test_bucket.bucket

#   rule {
#     apply_server_side_encryption_by_default {
#       kms_master_key_id = aws_kms_key.test.arn
#       sse_algorithm     = "aws:kms"
#     }
#   }
# }