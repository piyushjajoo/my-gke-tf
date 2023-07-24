# gke module

This is the documentation for gke module.

## Summary

This module creates following resources -
- gke cluster with a default worker nodepool
- optionally you can create more worker nodepools

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.74.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.74.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_container_cluster.gke](https://registry.terraform.io/providers/hashicorp/google/4.74.0/docs/resources/container_cluster) | resource |
| [google_container_node_pool.nodepools](https://registry.terraform.io/providers/hashicorp/google/4.74.0/docs/resources/container_node_pool) | resource |
| [google_project_service.main](https://registry.terraform.io/providers/hashicorp/google/4.74.0/docs/resources/project_service) | resource |
| [google_compute_zones.available](https://registry.terraform.io/providers/hashicorp/google/4.74.0/docs/data-sources/compute_zones) | data source |
| [google_container_engine_versions.main](https://registry.terraform.io/providers/hashicorp/google/4.74.0/docs/data-sources/container_engine_versions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster, unique within the project and location. | `string` | n/a | yes |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | kubernetes version | `string` | `"1.27"` | no |
| <a name="input_network"></a> [network](#input\_network) | The name or self\_link of the Google Compute Engine network to which the cluster is connected. For Shared VPC, set this to the self link of the shared network. | `string` | n/a | yes |
| <a name="input_nodepools"></a> [nodepools](#input\_nodepools) | Nodepools for the Kubernetes cluster | <pre>map(object({<br>    name         = string<br>    node_count   = number<br>    node_labels  = map(any)<br>    machine_type = string<br>  }))</pre> | <pre>{<br>  "worker": {<br>    "machine_type": "n1-standard-1",<br>    "name": "worker",<br>    "node_count": 1,<br>    "node_labels": {<br>      "worker-name": "worker"<br>    }<br>  }<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The location (region or zone) in which the cluster master will be created, as well as the default node location. If you specify a zone (such as us-central1-a), the cluster will be a zonal cluster with a single cluster master. If you specify a region (such as us-west1), the cluster will be a regional cluster with multiple masters spread across zones in the region, and with default node locations in those zones as well | `string` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The name or self\_link of the Google Compute Engine subnetwork in which the cluster's instances are launched. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | Base64 encoded private key used by clients to authenticate to the cluster endpoint. |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | Base64 encoded public certificate that is the root certificate of the cluster. |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | an identifier for the resource with format projects/{{project}}/locations/{{zone}}/clusters/{{name}} |
| <a name="output_cluster_master_version"></a> [cluster\_master\_version](#output\_cluster\_master\_version) | The current version of the master in the cluster. This may be different than the min\_master\_version set in the config if the master has been updated by GKE. |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The IP address of this cluster's Kubernetes master. |