# Google Cloud Filestore for Lustre Terraform Module

This module simplifies the deployment of a [Google Cloud Filestore for Lustre](https://cloud.google.com/filestore/docs/lustre-overview) instance. Filestore for Lustre is a fully managed, high-performance parallel file system that is optimized for High Performance Computing (HPC) workloads.

This module creates a Filestore instance with the `ENTERPRISE` tier and connects it to a specified VPC network using Private Service Access.

> [!WARNING]
> Filestore for Lustre is a [Beta feature](https://cloud.google.com/products#product-launch-stages). This module uses the `google-beta` provider and is subject to change.

## Usage

Basic usage of this module is as follows:

```hcl
module "filestore_lustre" {
  source          = "<PATH_TO_MODULE>"
  project_id      = "your-gcp-project-id"
  name            = "my-lustre-instance"
  location        = "us-central1-a"
  network_name    = "my-vpc-network"
  capacity_gib    = 4800
  file_share_name = "my-lustre-share"

  labels = {
    environment = "dev"
    owner       = "hpc-team"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which the resource belongs. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Lustre instance. Must start with a letter, contain only letters, numbers, and hyphens, and be between 1 and 63 characters long. | `string` | `"filestore-lustre-instance"` | no |
| <a name="input_location"></a> [location](#input\_location) | The GCP zone for the Lustre instance (e.g., us-central1-a). | `string` | `"us-central1-a"` | no |
| <a name="input_capacity_gib"></a> [capacity\_gib](#input\_capacity\_gib) | The capacity of the Lustre instance in gibibytes (GiB). Must be a multiple of 2400 GiB. The minimum capacity is 2400 GiB. | `number` | `2400` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the VPC network to which the Lustre instance is connected. | `string` | `"default"` | no |
| <a name="input_file_share_name"></a> [file\_share\_name](#input\_file\_share\_name) | The name of the file share. Must be 16 characters or less. | `string` | `"lustre_share"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A map of key/value label pairs to assign to the Lustre instance. | `map(string)` | `{}` | no |
| <a name="input_connect_mode"></a> [connect\_mode](#input\_connect\_mode) | The connection mode of the Lustre instance. The only supported value is `PRIVATE_SERVICE_ACCESS`. | `string` | `"PRIVATE_SERVICE_ACCESS"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_points"></a> [access\_points](#output\_access\_points) | A list of IP addresses of the Lustre instance's access points. |
| <a name="output_create_time"></a> [create\_time](#output\_create\_time) | The time when the Lustre instance was created. |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier for the Lustre instance, in the format `projects/{{project}}/locations/{{location}}/instances/{{name}}`. |
| <a name="output_instance"></a> [instance](#output\_instance) | The full Lustre instance resource object. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Lustre instance. |
| <a name="output_state"></a> [state](#output\_state) | The current state of the Lustre instance. |

## Requirements

These sections describe requirements for using this module.

### Software

*   [Terraform](https://www.terraform.io/downloads.html) v1.3.0 or later.
*   [Terraform Provider for Google Cloud Beta](https://github.com/hashicorp/terraform-provider-google-beta) ~> 5.53.

### Service Account

A service account with the following roles is required to provision the resources of this module:

*   Cloud Filestore Editor: `roles/file.editor`
*   Compute Network User: `roles/compute.networkUser`

### APIs

The following APIs must be enabled on the project:

*   Cloud Filestore API: `file.googleapis.com`
*   Service Networking API: `servicenetworking.googleapis.com`
*   Compute Engine API: `compute.googleapis.com`
