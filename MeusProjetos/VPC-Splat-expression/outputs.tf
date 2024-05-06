output "subnets_id" {
  description = "ID da subnets criadas na AWS"
  value       = aws_subnet.subnet_terraform[*].id
}

