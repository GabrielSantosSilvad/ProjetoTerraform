resource "aws_key_pair" "key_acesso" { 
  key_name   = "aws-key-${var.is_production}"
  public_key = file("./aws-key.pub")

}


resource "aws_instance" "vm" {
  ami                         = "ami-0b8b44ec9a8f90422"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key_acesso.key_name
  subnet_id                   = module.network.subnet_id_a
  vpc_security_group_ids      = [module.network.security_id]
  associate_public_ip_address = true

  tags = {
    Name = "vm-${var.is_production}"
  }
}

