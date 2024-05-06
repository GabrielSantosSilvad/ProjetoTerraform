resource "aws_key_pair" "key_acesso" { #ssh-keygen -f aws-key
  key_name   = "aws-key-${var.is_production}"
  public_key = file("./aws-key.pub")

}


resource "aws_instance" "vm" {
  ami                         = "ami-0b8b44ec9a8f90422"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key_acesso.key_name
  subnet_id                   = module.network.subnet_id
  vpc_security_group_ids      = [module.network.security_id]
  associate_public_ip_address = true

  tags = {
    Name = "vm-${var.is_production}"
  }
}

#Entrar na maquina ssh -i aws-key ubuntu@3.142.241.204