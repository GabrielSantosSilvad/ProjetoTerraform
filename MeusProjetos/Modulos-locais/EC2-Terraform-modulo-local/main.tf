terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.45.0"

    }
  }
  backend "s3" {
    bucket = "gabrieltesteremotestate"
    key    = "aws-ec2-modulos-locais/terraform.tfstate"
    region = "us-east-2"
  }

}

provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = { # colocar tags pra quando ver la a bucket mostrar q foi feito pelo pai e usado terraform
      owner      = "Gabriel"
      managed-by = "terraform"

    }
  }
}



module "network" {
  source      = "./network"
  cidr_vpc    = "10.1.0.0/16"
  cidr_subnet = "10.1.1.0/24"
  environment = var.is_production
}
