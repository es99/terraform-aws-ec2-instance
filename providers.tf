terraform {
  backend "s3" {
    bucket = "estudosterraform-engels"
    key    = "terraform-testes"
    region = "us-east-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}