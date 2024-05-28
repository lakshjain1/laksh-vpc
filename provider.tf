terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.51.1"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-laksh"
    key    = "laksh-VPC-demo"
    region = "us-east-1"
    dynamodb_table = "laksh-locking"
  }
}
