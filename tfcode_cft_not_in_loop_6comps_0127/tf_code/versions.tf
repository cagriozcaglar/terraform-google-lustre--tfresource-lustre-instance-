terraform {
  # This module is tested with Terraform 1.3 and onward.
  required_version = ">= 1.3.0"

  required_providers {
    # Google Cloud provider for managing GCP resources.
    google = {
      source  = "hashicorp/google"
      version = "~> 5.13"
    }
  }
}
