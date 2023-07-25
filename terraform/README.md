<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | 1.51.1 |
| <a name="requirement_selectel"></a> [selectel](#requirement\_selectel) | 3.9.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | 1.51.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.inventory](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [openstack_blockstorage_volume_v3.volume](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/resources/blockstorage_volume_v3) | resource |
| [openstack_compute_floatingip_associate_v2.public_ip](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/resources/compute_floatingip_associate_v2) | resource |
| [openstack_compute_instance_v2.vm](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/resources/compute_instance_v2) | resource |
| [openstack_compute_keypair_v2.nkom_ssh_key](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/resources/compute_keypair_v2) | resource |
| [openstack_networking_floatingip_v2.public_ip](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/resources/networking_floatingip_v2) | resource |
| [openstack_networking_network_v2.private_net](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/resources/networking_network_v2) | resource |
| [openstack_networking_router_interface_v2.router_interface_private_net_subnet](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/resources/networking_router_interface_v2) | resource |
| [openstack_networking_router_v2.router_1](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/resources/networking_router_v2) | resource |
| [openstack_networking_subnet_v2.private_net_subnet](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/resources/networking_subnet_v2) | resource |
| [openstack_compute_flavor_v2.small](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/data-sources/compute_flavor_v2) | data source |
| [openstack_images_image_v2.os_image](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/data-sources/images_image_v2) | data source |
| [openstack_networking_network_v2.external_net](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.51.1/docs/data-sources/networking_network_v2) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_zone"></a> [az\_zone](#input\_az\_zone) | Pool segment to create resources in | `string` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | OS image name | `string` | n/a | yes |
| <a name="input_os_password"></a> [os\_password](#input\_os\_password) | Openstack password | `string` | n/a | yes |
| <a name="input_os_username"></a> [os\_username](#input\_os\_username) | Openstack username | `string` | n/a | yes |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | SSH public key value to add on created vm | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Pool to create resources in | `string` | n/a | yes |
| <a name="input_selectel_token"></a> [selectel\_token](#input\_selectel\_token) | Token to access selectel resources | `string` | n/a | yes |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | CIDR of private network to create | `string` | n/a | yes |
| <a name="input_vms"></a> [vms](#input\_vms) | Names of app vms to create | `list` | n/a | yes |
| <a name="input_vms_public"></a> [vms\_public](#input\_vms\_public) | Names of app vms to associate public IP with | `list` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_droplet_private_ip"></a> [droplet\_private\_ip](#output\_droplet\_private\_ip) | n/a |
| <a name="output_droplet_public_ip"></a> [droplet\_public\_ip](#output\_droplet\_public\_ip) | n/a |
| <a name="output_instance_udid"></a> [instance\_udid](#output\_instance\_udid) | n/a |
<!-- END_TF_DOCS -->