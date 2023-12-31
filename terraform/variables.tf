variable selectel_token {
	type = string
	description = "Token to access selectel resources"
}

variable os_username {
	type = string
	description = "Openstack username"
}

variable os_password {
	type = string
	description = "Openstack password"
}

variable "region" {
	type = string
	description = "Pool to create resources in"
}

variable "public_key" {
  type = string
	description = "SSH public key value to add on created vm"
}

variable "az_zone" {
  type = string
	description = "Pool segment to create resources in"
}

variable "subnet_cidr" {
	type = string
	description = "CIDR of private network to create"
}

variable "image" {
	type = string
	description = "OS image name"
}

variable "vms" {
	type = list
	description = "Names of app vms to create"
}

variable "volume_size" {
	type = list
	description = "Volume size for vms"
}

variable "volume_type" {
  type = list
  description = "Volume type for vms"
}

variable "vm_flavor" {
	type = list
	description = "VM flavors"
}
variable "vms_public" {
	type = list
	description = "Names of app vms to associate public IP with"
}
