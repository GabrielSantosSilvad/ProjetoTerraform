output "subnet_id_a" {
  description = "ID da subnet_a"
  value       = aws_subnet.subnet_terraform_b.id
}

output "subnet_id_b" {
  description = "ID da subnet_b"
  value       = aws_subnet.subnet_terraform_b.id
}


output "security_id" {
  description = "id do security group"
  value       = aws_security_group.security_terraform.id
}


output "name_grupo_Subnet" {
  description = "nome do Grupo de segurança"
  value       = aws_db_subnet_group.Sub_net_Grupo.name

}

