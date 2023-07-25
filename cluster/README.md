# cluster

This is top level module creates resource group, vnet, subnets and aks cluster by calling [vpc_and_subnets](../modules/vpc_and_subnets/README.md) and [gke](../modules/gke/README.md) modules.

## Summary

This module creates following resources -
- VPC
- Subnet
- GKE Cluster with a worker nodepool if no nodepool specificed
- OR Optionally can create more worker nodepools

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke_with_node_group"></a> [gke\_with\_node\_group](#module\_gke\_with\_node\_group) | [gke](../modules/gke) | n/a |
| <a name="module_vpc_with_subnets"></a> [vpc\_with\_subnets](#module\_vpc\_with\_subnets) | [vpc_with_subnets](../modules/vpc_and_subnets) | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidrBlock"></a> [cidrBlock](#input\_cidrBlock) | The cidr block for subnet | `string` | `"10.1.0.0/16"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | vpc, subnet and gke cluster name | `string` | n/a | yes |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | kubernetes version | `string` | `"1.27"` | no |
| <a name="input_nodepools"></a> [nodepools](#input\_nodepools) | Nodepools for the Kubernetes cluster | <pre>map(object({<br>    name         = string<br>    node_count   = number<br>    node_labels  = map(any)<br>    machine_type = string<br>  }))</pre> | <pre>{<br>  "worker": {<br>    "machine_type": "n1-standard-1",<br>    "name": "worker",<br>    "node_count": 1,<br>    "node_labels": {<br>      "worker-name": "worker"<br>    }<br>  }<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | gcp region where the gke cluster must be created, this region should match where you have created the vpc and subnet | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | Base64 encoded private key used by clients to authenticate to the cluster endpoint. |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | Base64 encoded public certificate that is the root certificate of the cluster. |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | an identifier for the resource with format projects/{{project}}/locations/{{zone}}/clusters/{{name}} |
| <a name="output_cluster_master_version"></a> [cluster\_master\_version](#output\_cluster\_master\_version) | The current version of the master in the cluster. This may be different than the min\_master\_version set in the config if the master has been updated by GKE. |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The IP address of this cluster's Kubernetes master. |
| <a name="output_subnet_self_link"></a> [subnet\_self\_link](#output\_subnet\_self\_link) | The URI of the created resource |
| <a name="output_vpc_self_link"></a> [vpc\_self\_link](#output\_vpc\_self\_link) | The URI of the created resource |
