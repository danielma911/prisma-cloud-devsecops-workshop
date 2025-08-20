provider "google" {
  project = var.project_id
  region  = var.region
}


resource "google_storage_bucket" "example" {
  name          = "demo-${random_id.rand_suffix.hex}"
  location      = "us-central1"
  force_destroy = true

  uniform_bucket_level_access = false

}

resource "random_id" "rand_suffix" {
  byte_length = 4
}


output "Bucket_name" {
  value = google_storage_bucket.sample.name
}
