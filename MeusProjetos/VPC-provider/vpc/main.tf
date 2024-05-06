terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "5.45.0"
      configuration_aliases = [aws.provider_1, aws.provider_2]
    }
  }
}
