terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }
  backend "s3" {
    bucket = "trader-tracker"
    key    = "infrastructure/core.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.region
}


