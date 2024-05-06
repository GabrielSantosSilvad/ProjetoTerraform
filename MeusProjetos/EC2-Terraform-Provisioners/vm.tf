resource "aws_key_pair" "key_acesso" { 
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")

}


resource "aws_instance" "vm" {
  ami                         = var.ambiente == "dev" ? "ami-0b8b44ec9a8f90422" : "ami-0cd59ecaf368e5ccf"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key_acesso.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_id]
  associate_public_ip_address = var.ambiente == "dev" ? true : false


  provisioner "local-exec" { 
    command = "echo ${self.public_ip} >> public_ip.txt"
  }

  provisioner "remote-exec" { 
    inline = [
      "echo subnet_id: ${data.terraform_remote_state.vpc.outputs.subnet_id} >> /tmp/network_info.txt",
      "echo security_group_id: ${data.terraform_remote_state.vpc.outputs.security_id} >> /tmp/network_info.txt",
    ]
  }

  provisioner "file" { 
    source      = "./test.txt"
    destination = "/tmp/doidera.txt"
  }

  provisioner "file" { 
    content     = "ami used: ${self.ami}"
    destination = "/tmp/ami.txt"
  }



  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./aws-key")
    host        = self.public_ip
  }

  tags = {
    Name = "vm-terraform"
  }
}

