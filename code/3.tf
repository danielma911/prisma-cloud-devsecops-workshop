provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "9cb510ae-7099-46e9-9971-7bd9c94ab5a5"
    git_commit           = "9c53822adf47a5aa4a7c57fb6e15ee08ce992db8"
    git_file             = "code/3.tf"
    git_last_modified_at = "2025-08-13 00:51:41"
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
