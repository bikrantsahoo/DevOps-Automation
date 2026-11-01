output "s3_bucket_name" {
  description = "Terraform remote state S3 bucket"
  value       = aws_s3_bucket.terraform_state.id
}

output "dynamodb_table_name" {
  description = "DynamoDB state locking table"
  value       = aws_dynamodb_table.terraform_lock.name
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.terraform_state.arn
}
