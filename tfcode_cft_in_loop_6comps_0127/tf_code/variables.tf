variable "capacity_gib" {
  description = "The capacity of the Lustre instance in gibibytes (GiB). Must be a multiple of 2400 GiB. The minimum capacity is 2400 GiB."
  type        = number
  default     = 2400
  validation {
    condition     = var.capacity_gib >= 2400 && var.capacity_gib % 2400 == 0
    error_message = "The capacity_gib must be at least 2400 and a multiple of 2400."
  }
}

variable "connect_mode" {
  description = "The connection mode of the Lustre instance. The only supported value is `PRIVATE_SERVICE_ACCESS`."
  type        = string
  default     = "PRIVATE_SERVICE_ACCESS"
  validation {
    condition     = var.connect_mode == "PRIVATE_SERVICE_ACCESS"
    error_message = "The only supported value for connect_mode is 'PRIVATE_SERVICE_ACCESS'."
  }
}

variable "file_share_name" {
  description = "The name of the file share. Must be 16 characters or less."
  type        = string
  default     = "lustre_share"
  validation {
    condition     = length(var.file_share_name) <= 16
    error_message = "The file_share_name must be 16 characters or less."
  }
}

variable "labels" {
  description = "A map of key/value label pairs to assign to the Lustre instance."
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "The GCP zone for the Lustre instance (e.g., us-central1-a)."
  type        = string
  default     = "us-central1-a"
}

variable "name" {
  description = "The name of the Lustre instance. Must start with a letter, contain only letters, numbers, and hyphens, and be between 1 and 63 characters long."
  type        = string
  default     = "filestore-lustre-instance"
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$", var.name))
    error_message = "The instance name must be 1-63 characters long, start with a letter, and contain only lowercase letters, numbers, and hyphens."
  }
}

variable "network_name" {
  description = "The name of the VPC network to which the Lustre instance is connected."
  type        = string
  default     = "default"
}

variable "project_id" {
  description = "The ID of the project in which the resource belongs."
  type        = string
}
