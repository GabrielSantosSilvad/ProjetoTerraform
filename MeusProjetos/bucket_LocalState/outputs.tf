output "bucket_id" {
  description = "ID da bucket"
  value = aws_s3_bucket.teste_bucket.id
}

output "bucket_arn" {
  description = "anr da bucket"
  value = aws_s3_bucket.teste_bucket.arn
}