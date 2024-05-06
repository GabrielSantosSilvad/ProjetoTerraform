terraform {
  backend "s3" {
    bucket = "terraform-state-teste-ecs"
    key    = "homolog/terraform.tfstate"
    region = "us-east-1"
  }
}




