output "arn" {
  description = "The arn of the bucket"
  value       = aws_s3_bucket.test_bucket.arn
}