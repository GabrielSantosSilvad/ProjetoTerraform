output "provider_1_id" {
  description = "Id da VPC do provider 1"
  value       = aws_vpc.provider_1.id
}

output "provider_2_id" {
  description = "Id da VPC do provider 2"
  value       = aws_vpc.provider_2.id
}

output "default_id" {
  description = "a padrão VPC"
  value       = aws_vpc.default.id
}