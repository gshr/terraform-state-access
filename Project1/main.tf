terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket = "aws-state-bucket-sb1"
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "dynamodb_state_table"
    
  }

}

provider "aws" {
  region  = "ap-south-1"
}


resource "aws_s3_bucket" "s3_state_bucket" {
    bucket  = "aws-state-bucket-sb2"
}

resource "aws_s3_bucket" "s3_state_bucket2" {
    bucket  = "aws-state-bucket-sb3"
}


output "bucket_name" {
  value = aws_s3_bucket.s3_state_bucket.bucket
}


