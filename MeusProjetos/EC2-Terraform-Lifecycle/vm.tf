resource "aws_key_pair" "key_acesso" { 
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")

}


resource "aws_instance" "vm" {
  ami                         = "ami-0b8b44ec9a8f90422"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key_acesso.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_id]
  associate_public_ip_address = true

  lifecycle {
    #prevent_destroy = true aqui 
    replace_triggered_by = [aws_s3_bucket.teste_terraform] 
  }

  tags = {
    Name = "vm-terraform"
  }
}

