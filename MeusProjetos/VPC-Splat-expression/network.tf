resource "aws_vpc" "vpc_terraform" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "vpc-terraform"
  }
}

resource "aws_subnet" "subnet_terraform" {
  count = 3
 
  vpc_id     = aws_vpc.vpc_terraform.id
  cidr_block = "10.1.${count.index}.0/24"

  tags = {
    Name = "subnet-terraform-${count.index}"
  }
}







