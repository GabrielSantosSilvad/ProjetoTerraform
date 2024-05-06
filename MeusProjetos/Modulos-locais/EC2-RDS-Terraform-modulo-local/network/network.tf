resource "aws_vpc" "vpc_terraform" {
  cidr_block = var.cidr_vpc

  tags = {
    Name = "vpc-${var.environment}"
  }
}

resource "aws_subnet" "subnet_terraform_a" {
  vpc_id            = aws_vpc.vpc_terraform.id
  cidr_block        = var.cidr_subnet_a
  availability_zone = "us-east-2a"
  tags = {
    Name = "subnet_a-${var.environment}"
  }
}

resource "aws_subnet" "subnet_terraform_b" {
  vpc_id            = aws_vpc.vpc_terraform.id
  cidr_block        = var.cidr_subnet_b
  availability_zone = "us-east-2b"
  tags = {
    Name = "subnet_b-${var.environment}"
  }
}

resource "aws_db_subnet_group" "Sub_net_Grupo" {
  name       = "db"
  subnet_ids = ["${aws_subnet.subnet_terraform_a.id}", "${aws_subnet.subnet_terraform_b.id}"]
  tags = {
    Name = "subnet-terraform-db-group-${var.environment}"
  }

}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_terraform.id

  tags = {
    Name = "gw-terraform-${var.environment}"
  }
}

resource "aws_route_table" "route_terraform" {
  vpc_id = aws_vpc.vpc_terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "route-${var.environment}"
  }
}
resource "aws_route_table_association" "RT_subterraform_a" { 
  subnet_id      = aws_subnet.subnet_terraform_a.id
  route_table_id = aws_route_table.route_terraform.id
}
resource "aws_route_table_association" "RT_subterraform_b" { 
  subnet_id      = aws_subnet.subnet_terraform_b.id
  route_table_id = aws_route_table.route_terraform.id
}


resource "aws_security_group" "security_terraform" {
  name        = "security-${var.environment}"
  description = "Permitir acesso "
  vpc_id      = aws_vpc.vpc_terraform.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "HTTP"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    description = "Liberando Saida "
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "security-${var.environment}"
  }
}

 