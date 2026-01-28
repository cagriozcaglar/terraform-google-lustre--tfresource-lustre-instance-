terraform {
  # This module requires Terraform v1.3.0 or later.
  required_version = ">= 1.3.0"
  required_providers {
    # The google-beta provider is required for creating Filestore for Lustre instances,
    # as this feature is currently in beta.
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.53"
    }
  }
}
