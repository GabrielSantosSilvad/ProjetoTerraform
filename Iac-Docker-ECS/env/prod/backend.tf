terraform {
  backend "s3" {
    bucket = "terraform-state-teste-ecs"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}


