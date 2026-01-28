variable "name" {
  description = "The resource name of the Lustre instance."
  type        = string
  default     = "lustre-instance-example"
}

variable "location" {
  description = "The GCP zone where the instance will be created, e.g., `us-central1-a`."
  type        = string
  default     = "us-central1-a"
}

variable "network" {
  description = "The full name of the VPC network to connect to, e.g. `projects/my-project/global/networks/my-network`."
  type        = string
  default     = "default"
}

variable "file_share_name" {
  description = "The name of the file share being created. The name must be unique for the instance."
  type        = string
  default     = "lustre-share"
}

variable "capacity_gb" {
  description = "The capacity of the file share in GiB. Must be at least 1200 (1.2 TiB) and a multiple of 1200."
  type        = number
  default     = 1200
  validation {
    condition     = var.capacity_gb >= 1200 && var.capacity_gb % 1200 == 0
    error_message = "For Lustre, the capacity_gb must be at least 1200 and a multiple of 1200."
  }
}

variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
  default     = null
}

variable "description" {
  description = "A description of the instance."
  type        = string
  default     = null
}

variable "labels" {
  description = "A set of key/value label pairs to apply to the instance."
  type        = map(string)
  default     = {}
}

variable "kms_key_name" {
  description = "The resource name of the customer-managed encryption key (CMEK) to use for the instance, e.g., `projects/my-project/locations/us-central1/keyRings/my-ring/cryptoKeys/my-key`. If not provided, Google-managed encryption will be used."
  type        = string
  default     = null
}

variable "connect_mode" {
  description = "The network connect mode of the Filestore instance. If not provided, DIRECT_PEERING will be used."
  type        = string
  default     = "DIRECT_PEERING"
  validation {
    condition     = contains(["DIRECT_PEERING", "PRIVATE_SERVICE_ACCESS"], var.connect_mode)
    error_message = "The connect_mode must be either DIRECT_PEERING or PRIVATE_SERVICE_ACCESS."
  }
}

variable "reserved_ip_range" {
  description = "A /29 CIDR block in one of the allocated IP ranges. If not provided, a range will be automatically allocated."
  type        = string
  default     = null
}

variable "network_modes" {
  description = "IP versions for the instance. Lustre only supports MODE_IPV4."
  type        = list(string)
  default     = ["MODE_IPV4"]
  validation {
    condition     = length(var.network_modes) == 1 && var.network_modes[0] == "MODE_IPV4"
    error_message = "The network_modes must contain only 'MODE_IPV4' for Lustre instances."
  }
}
