terraform {
  backend "s3" {
    bucket = "terraform-state-teste-eks-prod"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}




