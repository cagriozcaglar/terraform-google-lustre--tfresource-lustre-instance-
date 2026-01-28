# This module creates a Google Cloud Filestore instance for Lustre.
# Note: Filestore for Lustre is a beta feature. This module uses the google-beta provider.
resource "google_filestore_instance" "main" {
  provider = google-beta
  # (Required) The name for the Lustre instance. Must start with a letter, contain only letters, numbers, and hyphens, and be between 1 and 63 characters long.
  name = var.name

  # (Required) The GCP zone for the instance, e.g., us-central1-a. For Lustre instances, this must be a zone.
  location = var.location

  # (Optional) The ID of the project where the instance will be created.
  project = var.project_id

  # (Required) The service tier for the instance. For Lustre, this must be ENTERPRISE.
  tier = "ENTERPRISE"

  # (Optional) A map of key/value label pairs to assign to the Lustre instance.
  labels = var.labels

  # (Required) File share configuration for the instance.
  file_shares {
    # (Required) The name of the file share. Must be 16 characters or less.
    name = var.file_share_name
    # (Required) The capacity of the Lustre instance in GiB. Must be a multiple of 2400 GiB. The minimum capacity is 2400 GiB.
    capacity_gb = var.capacity_gib
  }

  # (Required) VPC network configuration for the instance.
  networks {
    # (Required) The full name of the VPC network to which the Lustre instance is connected.
    network = "projects/${var.project_id}/global/networks/${var.network_name}"
    # (Required) The network modes. MODE_IPV4 is the only supported mode.
    modes = ["MODE_IPV4"]
    # (Optional) The connection mode. Only PRIVATE_SERVICE_ACCESS is supported.
    connect_mode = var.connect_mode
  }
}
