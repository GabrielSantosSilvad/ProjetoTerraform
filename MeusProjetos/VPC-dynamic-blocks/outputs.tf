output "subnet_id" {
  description = "ID da subnet"
  value       = aws_subnet.subnet_terraform.id
}

output "security_id" {
  description = "id do security group"
  value       = aws_security_group.security_terraform.id
}

