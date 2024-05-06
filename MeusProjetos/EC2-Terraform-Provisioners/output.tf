output "Ip_public" {
  description = "Exposição do ip publico"
  value       = aws_instance.vm.public_ip
}