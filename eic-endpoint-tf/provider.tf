terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      version = "5.59.0"
    }
  }
}

provider "aws" {
  region = "<AWS_REGION>"
}
