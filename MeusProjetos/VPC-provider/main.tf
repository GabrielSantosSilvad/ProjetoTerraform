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
    key    = "aws-vpc-provider/terraform.tfstate"
    region = "us-east-2"
  }

}

provider "aws" {
  alias  = "eua"
  region = "us-east-1"
  default_tags {
    tags = { 
      owner      = "Gabriel"
      managed-by = "terraform"

    }
  }
}


provider "aws" {
  alias  = "australia"
  region = "ap-southeast-2"
  default_tags {
    tags = { 
      owner      = "Gabriel"
      managed-by = "terraform"

    }
  }
}

data "terraform_remote_state" "VM" { 
  backend = "s3"
  config = {
    bucket = "gabrieltesteremotestate"
    key    = "aws-ec2/terraform.tfstate"
    region = "us-east-2"
  }
}

module "VPC" {
  source = "./vpc"
  providers = {
    aws.provider_1 = aws.australia
    aws.provider_2 = aws.eua
  }
}