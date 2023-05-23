provider "aws" {
  region     = "us-east-1"
  access_key = "Your access key"
  secret_key = "Your secret key"

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.30.0"
    }
  }
}
