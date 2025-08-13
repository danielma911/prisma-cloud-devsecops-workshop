terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}
variable "google_credentials" {
  description = "GCP service account JSON key"
  type        = string
  sensitive   = true
}

provider "google" {
  project = "qwiklabs-gcp-03-ef77dfc22296"
  region  = "us-central1"
}

resource "google_storage_bucket" "example" {
  name          = "demo-${random_id.rand_suffix.hex}"
  location      = "us-central1"
  force_destroy = false

  uniform_bucket_level_access = true
  labels = {
    yor_name             = "example"
    yor_trace            = "ef79f2f9-daec-43f0-83eb-c4791a7cb288"
    git_commit           = "eb17b6f0bc65e7263678819559b52ce606075edf"
    git_file             = "code__build__gcs_tf"
    git_last_modified_at = "2025-08-13-01-55-30"
    git_last_modified_by = "52453932danielma911"
    git_modifiers        = "18621833570__52453932danielma911"
    git_org              = "danielma911"
    git_repo             = "prisma-cloud-devsecops-workshop"
  }
}

resource "random_id" "rand_suffix" {
  byte_length = 4
}

output "bucket_name" {
  value = google_storage_bucket.example.name
}
