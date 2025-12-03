terraform {
  required_version = "~>1.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "ordynskyi-step-project-3"
    region = "eu-central-1"
    key    = "terraform/terraform.tfstate"
  }
}
provider "aws" {
  region = "eu-central-1"
}
