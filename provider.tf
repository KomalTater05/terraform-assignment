provider "aws" {
  region = "ap-south-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
terraform {
    backend "s3" {
        bucket = "eks-backend-k" #buceket name
        key    = "state/terraform.tfstate" #path where we are going to st ore the state file
        region     = "ap-south-1" 
        dynamodb_table = "dynamodb-state-lock" #dynamodb table creation
    }
}