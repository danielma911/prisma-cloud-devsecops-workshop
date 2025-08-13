provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "022a6e38-8a3a-4584-9d56-42a4cf6e531a"
    git_commit           = "17f9be4d3f5284d8540189399de8e657df73c9dc"
    git_file             = "code/s3.tf"
    git_last_modified_at = "2025-08-13 00:41:23"
    git_last_modified_by = "52453932+danielma911@users.noreply.github.com"
    git_modifiers        = "52453932+danielma911"
    git_org              = "danielma911"
    git_repo             = "prisma-cloud-devsecops-workshop"
  }
}

resource "aws_s3_bucket_ownership_controls" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
