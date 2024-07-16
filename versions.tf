terraform {
  required_version = ">= 1.1.5"
  required_providers {
    aws = ">= 4.27"
  }
}


provider "aws" {
  region = var.region
}

