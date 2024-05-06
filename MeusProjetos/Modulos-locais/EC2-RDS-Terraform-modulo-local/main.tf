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
    key    = "aws-ec2-rds-vpc-modulos-locais/terraform.tfstate"
    region = "us-east-2"
  }

}

provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = { 
      owner      = "Gabriel"
      managed-by = "terraform"

    }
  }
}



module "network" {
  source        = "./network"
  cidr_vpc      = "10.1.0.0/16"
  cidr_subnet_a = "10.1.1.0/24"
  cidr_subnet_b = "10.1.2.0/24"
  environment   = var.is_production
}

module "rds" {
  source                 = "./rds"
  allocated_storage_rds  = 10
  name_db                = "Teste_Modulo"
  instance_class_db      = "db.t3.micro"
  db_subnet_group        = module.network.name_grupo_Subnet
  vpc_security_group_ids = module.network.security_id
  Skip_snapshot_final    = true
}