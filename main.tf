provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "mypcbucketfortfstatefile"
    key    = "workspace.tfstate"
    region = "ap-south-1"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_efs_file_system" "foo" {

  tags = {
    Name = "var.efs_tag"
  }
}