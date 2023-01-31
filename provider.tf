terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.51.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAT5GREXUUYOS4SCZV"
  secret_key = "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"
}