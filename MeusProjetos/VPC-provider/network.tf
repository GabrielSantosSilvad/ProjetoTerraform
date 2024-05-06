resource "aws_subnet" "subnet_terraform_1" {
  provider   = aws.australia
  vpc_id     = module.VPC.provider_1_id
  cidr_block = "10.1.1.0/24"

  tags = {
    Name = "subnet-terraform-provider"
  }
}

resource "aws_subnet" "subnet_terraform_2" {
  provider   = aws.eua
  cidr_block = "10.1.1.0/24"
  vpc_id     = module.VPC.provider_2_id
  tags = {
    Name = "subnet-terraform-provider"
  }
}

resource "aws_subnet" "subnet_terraform_default" {

  cidr_block = "10.1.1.0/24"
  vpc_id     = module.VPC.default_id
  tags = {
    Name = "subnet-terraform-provider"
  }
}

