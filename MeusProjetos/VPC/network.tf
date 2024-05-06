resource "aws_vpc" "vpc_terraform" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-terraform"
  }
}

resource "aws_subnet" "subnet_terraform" {
  vpc_id     = aws_vpc.vpc_terraform.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-terraform"
  }
}

resource "aws_subnet" "sub_net_db_1" {
  vpc_id            = aws_vpc.vpc_terraform.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name = "subnet-terraform-db-1"
  }
}

resource "aws_subnet" "sub_net_db_2" {
  vpc_id            = aws_vpc.vpc_terraform.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "subnet-terraform-db-2"
  }
}


resource "aws_db_subnet_group" "Sub_net_Grupo" {
  name       = "main"
  subnet_ids = ["${aws_subnet.sub_net_db_1.id}", "${aws_subnet.sub_net_db_2.id}"]
  tags = {
    Name = "subnet-terraform-db-group"
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
resource "aws_route_table" "route_DB" {
  vpc_id = aws_vpc.vpc_terraform.id

  tags = {
    Name = "route-terraform-db"
  }
}

resource "aws_route_table_association" "RT_subterraform" { 
  subnet_id      = aws_subnet.subnet_terraform.id
  route_table_id = aws_route_table.route_terraform.id
}

resource "aws_route_table_association" "RT_subterraform_db_1" { 
  subnet_id      = aws_subnet.sub_net_db_1.id
  route_table_id = aws_route_table.route_DB.id
}
resource "aws_route_table_association" "RT_subterraform_db_2" { 
  subnet_id      = aws_subnet.sub_net_db_2.id
  route_table_id = aws_route_table.route_DB.id
}


resource "aws_security_group" "security_terraform" {
  name        = "security-terraform"
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
}

resource "aws_security_group" "security_DB" {
  name        = "security-terraform-db"
  description = "teste_DB"
  vpc_id      = aws_vpc.vpc_terraform.id

  ingress {
    description = "Tudo"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_subnet.subnet_terraform.cidr_block]

  }
}

