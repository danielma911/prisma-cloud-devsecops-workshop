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
  name          = "${var.bucket_name}-${random_id.rand_suffix.hex}"
  location      = var.location
  force_destroy = false

  uniform_bucket_level_access = true
}

resource "random_id" "rand_suffix" {
  byte_length = 4
}

output "bucket_name" {
  value = google_storage_bucket.example.name
}