# vpc and subnet module

This is the documentation for vpc and subnet module.

## Summary

This module creates following resources -
- vpc
- subnet

Please read the documentation below to know details about the variables accepted by this module.

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
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/4.74.0/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.subnet](https://registry.terraform.io/providers/hashicorp/google/4.74.0/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidrBlock"></a> [cidrBlock](#input\_cidrBlock) | The range of internal addresses that are owned by this subnetwork. Provide this property when you create the subnetwork. For example, 10.0.0.0/8 or 192.168.0.0/16. Ranges must be unique and non-overlapping within a network. Only IPv4 is supported. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The GCP region for this subnetwork. | `string` | n/a | yes |
| <a name="input_subnet_description"></a> [subnet\_description](#input\_subnet\_description) | An optional description of this resource. Provide this property when you create the resource. This field can be set only at resource creation time. | `string` | `""` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The name of the resource, provided by the client when initially creating the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | `string` | n/a | yes |
| <a name="input_vpc_description"></a> [vpc\_description](#input\_vpc\_description) | An optional description of this resource. The resource must be recreated to modify this field. | `string` | `""` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | an identifier for the resource with format projects/{{project}}/regions/{{region}}/subnetworks/{{name}} |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | subnet name |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | an identifier for the resource with format projects/{{project}}/global/networks/{{name}} |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | vpc network name |