output "subnet_id" {
  description = "ID da subnet"
  value       = aws_subnet.subnet_terraform.id
}

output "security_id" {
  description = "id do security group"
  value       = aws_security_group.security_terraform.id
}

output "security_id_DB" {
  description = "id do security group DB "
  value       = aws_security_group.security_DB.id
}

output "subnet_id_DB" {
  description = "ID da subnet DB"
  value       = aws_subnet.sub_net_db_1.id
}

output "subnet_DB_nameGrupo" {
  description = "name da subnet DB"
  value       = aws_db_subnet_group.Sub_net_Grupo.name

}