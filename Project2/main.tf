terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
}

data "terraform_remote_state" "first_project_state" {
  backend = "s3"
  config = {
     bucket = "aws-state-bucket-sb1"
    key = "terraform.tfstate"
    region = "ap-south-1"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
bucket =data.terraform_remote_state.first_project_state.outputs.bucket_name
  versioning_configuration {
    status = "Enabled"
  }
}