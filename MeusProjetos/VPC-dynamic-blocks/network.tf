resource "aws_vpc" "vpc_terraform" {
  cidr_block = "10.2.0.0/16"

  tags = {
    Name = "vpc-terraform"
  }
}

resource "aws_subnet" "subnet_terraform" {
  vpc_id     = aws_vpc.vpc_terraform.id
  cidr_block = "10.2.1.0/24"

  tags = {
    Name = "subnet-terraform"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_terraform.id

  tags = {
    Name = "gw-terraform"
  }
}

resource "aws_route_table" "route_terraform" {
  vpc_id = aws_vpc.vpc_terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "route-terraform"
  }
}

resource "aws_route_table_association" "RT_subterraform" { 
  subnet_id      = aws_subnet.subnet_terraform.id
  route_table_id = aws_route_table.route_terraform.id
}


resource "aws_security_group" "security_terraform" {
  name   = "security-terraform"
  vpc_id = aws_vpc.vpc_terraform.id

  dynamic "ingress" {
    for_each = var.ports

    content {
      description = ingress.value.description
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = ingress.value["cidr_blocks"] 
    }
  }

  egress {
    description = "Liberando Saida "
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}



