terraform {
  backend "s3" {
    bucket = "terraform-state-teste-ks"
    key    = "homolog/terraform.tfstate"
    region = "us-east-1"
  }
}



