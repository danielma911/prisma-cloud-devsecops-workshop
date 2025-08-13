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
  labels = {
    yor_name  = "example"
    yor_trace = "ef79f2f9-daec-43f0-83eb-c4791a7cb288"
  }
}

resource "random_id" "rand_suffix" {
  byte_length = 4
}

output "bucket_name" {
  value = google_storage_bucket.example.name
}