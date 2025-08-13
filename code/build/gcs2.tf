terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}


provider "google" {
  project = "qwiklabs-gcp-03-ef77dfc22296"
  region  = "us-central1"
}

resource "google_storage_bucket" "example" {
  name          = "demo-${random_id.rand_suffix.hex}"
  location      = "us-central1"
  force_destroy = true

  uniform_bucket_level_access = false

  labels = {
    git_commit           = "e179c08a1d0a15b1a963df88701085af6b3c0276"
    git_file             = "code__build__gcs2_tf"
    git_last_modified_at = "2025-08-13-07-52-01"
    git_last_modified_by = "52453932danielma911"
    git_modifiers        = "52453932danielma911"
    git_org              = "danielma911"
    git_repo             = "prisma-cloud-devsecops-workshop"
    yor_name             = "example"
    yor_trace            = "e4fc1437-6ac2-4c42-b55a-7058756be648"
  }
}

resource "random_id" "rand_suffix" {
  byte_length = 4
}

output "bucket_name" {
  value = google_storage_bucket.example.name
}
