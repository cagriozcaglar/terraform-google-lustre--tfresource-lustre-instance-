# Google Cloud Filestore Lustre Module

This module provisions a Google Cloud Filestore instance with the Lustre file system. Lustre is a high-performance, parallel file system designed for High-Performance Computing (HPC) workloads.

This module creates a Zonal tier Filestore instance, which is required for Lustre.

## Usage

Basic usage of this module is as follows:

```hcl
module "filestore_lustre" {
  source          = "<PATH_TO_MODULE>"
  project_id      = "your-gcp-project-id"
  name            = "my-lustre-instance"
  location        = "us-central1-a"
  network         = "projects/your-gcp-project-id/global/networks/your-vpc-name"
  file_share_name = "my-lustre-share"
  capacity_gb     = 2400 // Must be a multiple of 1200
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| capacity\_gb | The capacity of the file share in GiB. Must be at least 1200 (1.2 TiB) and a multiple of 1200. | `number` | `1200` | no |
| connect\_mode | The network connect mode of the Filestore instance. If not provided, DIRECT\_PEERING will be used. Must be either `DIRECT_PEERING` or `PRIVATE_SERVICE_ACCESS`. | `string` | `"DIRECT_PEERING"` | no |
| description | A description of the instance. | `string` | `null` | no |
| file\_share\_name | The name of the file share being created. The name must be unique for the instance. | `string` | `"lustre-share"` | no |
| kms\_key\_name | The resource name of the customer-managed encryption key (CMEK) to use for the instance, e.g., `projects/my-project/locations/us-central1/keyRings/my-ring/cryptoKeys/my-key`. If not provided, Google-managed encryption will be used. | `string` | `null` | no |
| labels | A set of key/value label pairs to apply to the instance. | `map(string)` | `{}` | no |
| location | The GCP zone where the instance will be created, e.g., `us-central1-a`. | `string` | `"us-central1-a"` | no |
| name | The resource name of the Lustre instance. | `string` | `"lustre-instance-example"` | no |
| network | The full name of the VPC network to connect to, e.g. `projects/my-project/global/networks/my-network`. | `string` | `"default"` | no |
| network\_modes | IP versions for the instance. Lustre only supports MODE\_IPV4. | `list(string)` | `["MODE_IPV4"]` | no |
| project\_id | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | `string` | `null` | no |
| reserved\_ip\_range | A /29 CIDR block in one of the allocated IP ranges. If not provided, a range will be automatically allocated. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| create\_time | The time when the instance was created. |
| id | The resource identifier of the Lustre instance. |
| instance | The full Lustre instance resource object. |
| ip\_addresses | The IP addresses of the instance. Clients will use these to connect. |
| name | The name of the Lustre instance. |

## Requirements

### Terraform

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.13 |

### APIs

A project with the following APIs enabled is required:

-   Cloud Filestore API: `filestore.googleapis.com`
-   Compute Engine API: `compute.googleapis.com`

You can enable these APIs with the following `gcloud` command:

```
gcloud services enable \
  filestore.googleapis.com \
  compute.googleapis.com \
  --project="your-gcp-project-id"
```
