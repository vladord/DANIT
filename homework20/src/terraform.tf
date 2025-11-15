terraform {
  required_version = "~>1.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket               = "terraform-state-danit-devops-ord"
    region               = "eu-central-1"
    #workspace_key_prefix = "v.ordynskyi"
    key          = "v.ordynskyi/terraform.tfstate"
    use_lockfile = true
  }
}
provider "aws" {
  region = var.aws_region
}