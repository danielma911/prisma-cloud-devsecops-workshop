# Use variables for easy customization
variable "project_id" {
  description = "The ID of the Google Cloud project."
  type        = string
  default     = "qwiklabs-gcp-03-fa7edfd03d8e"
}

variable "region" {
  description = "The region where the instance will be created."
  type        = string
  default     = "us-central1"
}

variable "instance_name" {
  description = "The name of the Vertex AI Notebooks instance."
  type        = string
  default     = "my-public-notebook"
}

# Create the Vertex AI Notebooks Instance
# The correct resource name is google_notebooks_instance.
resource "google_notebooks_instance" "default" {
  # The name of the instance.
  name = var.instance_name
  # The location (region) where the instance will be deployed.
  location = var.region
  # The project ID where the instance will be created.
  project = var.project_id

  # Specify the machine type for the instance.
  # This example uses a standard machine type.
  # You can choose a different type (e.g., with GPU) as needed.
  machine_type = "n1-standard-4"

  # Configure the VM image for the instance.
  # This image includes the latest deep learning frameworks.
  # You can change the image family or project to a different one.
  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf2-2-11-cu113-notebooks"
  }

  # Add a boot disk configuration
  #boot_disk {
  #  disk_size_gb = 100
  #  disk_type    = "PD_SSD"
  #}
  boot_disk_size_gb = 100
  boot_disk_type    = "PD_SSD"
  # Set a custom shielded instance configuration
  shielded_instance_config {
    enable_vtpm = false
  }

  # By NOT including 'network' and 'subnet' blocks, the instance is
  # automatically configured to use a public IP address for accessibility,
  # fulfilling the "not private" requirement.
  labels = {
    git_commit           = "a2b352f95b0e1c8c623d20890906334ed3e80986"
    git_file             = "code__build__vertex_tf"
    git_last_modified_at = "2025-08-18-08-06-29"
    git_last_modified_by = "52453932danielma911"
    git_modifiers        = "52453932danielma911"
    git_org              = "danielma911"
    git_repo             = "prisma-cloud-devsecops-workshop"
    yor_name             = "default"
    yor_trace            = "281498c5-c2f7-4f70-8c84-b1cd10169f93"
  }
}

# Optional: Define an output to easily retrieve the instance name after creation
output "instance_name" {
  value = google_notebooks_instance.default.name
}
