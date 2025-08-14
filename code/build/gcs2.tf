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

  iam_binding {
    role    = "roles/storage.objectViewer"
    members = ["allUsers"] # Public Read Access
  }
  uniform_bucket_level_access = false

  labels = {
    yor_name             = "example"
    yor_trace            = "5434efdd-7044-4a1a-965f-d05935013689"
    git_commit           = "903cba2d90a05baf32f57b493d1883adc0a210a0"
    git_file             = "code__build__gcs2_tf"
    git_last_modified_at = "2025-08-14-06-18-25"
    git_last_modified_by = "52453932danielma911"
    git_modifiers        = "52453932danielma911"
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
