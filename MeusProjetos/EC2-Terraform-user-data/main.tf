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
    key    = "aws-ec2-user-data/terraform.tfstate"
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


data "terraform_remote_state" "vpc" { 
  backend = "s3"
  config = {
    bucket = "gabrieltesteremotestate"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-2"
  }
}
