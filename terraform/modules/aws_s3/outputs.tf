output "s3_instance_profile" {
  description = "ID of the S3's instance profile"
  value       = aws_iam_instance_profile.s3_instance_profile.id
}