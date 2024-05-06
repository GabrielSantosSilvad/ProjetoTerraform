output "Ip_public" {
  description = "Exposição do ip publico"
  value       = aws_instance.vm.public_ip
}

output "Ip_privado" {
  description = "Ip privado"
  value       = aws_instance.vm.private_ip
}

output "ID_vm" {
  description = "Id VM"
  value       = aws_instance.vm.id
}