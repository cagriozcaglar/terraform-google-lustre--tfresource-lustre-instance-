# Module to create a Google Cloud Filestore Lustre instance.
# A Zonal tier instance with the file_shares block defined will create a Lustre instance.
# Lustre is a high-performance, parallel file system, ideal for HPC workloads.
resource "google_filestore_instance" "lustre_instance" {
  # The ID of the project in which the resource belongs.
  project = var.project_id

  # The resource name of the instance.
  name = var.name

  # The GCP zone where the instance will be created.
  location = var.location

  # The service tier of the instance. Lustre is only available in the ZONAL tier.
  tier = "ZONAL"

  # A description for the instance.
  description = var.description

  # Key-value pairs to apply as labels to the instance.
  labels = var.labels

  # The resource name of the customer-managed encryption key (CMEK) for the instance.
  kms_key_name = var.kms_key_name

  # The file share configuration for the instance.
  file_shares {
    # The name of the file share.
    name = var.file_share_name

    # The capacity of the file share in GiB.
    capacity_gb = var.capacity_gb
  }

  # The network configuration for the instance.
  networks {
    # The VPC network to connect the instance to.
    network = var.network

    # The IP versions for the instance.
    modes = var.network_modes

    # The network connect mode.
    connect_mode = var.connect_mode

    # A reserved IP range for the instance.
    reserved_ip_range = var.reserved_ip_range
  }
}
