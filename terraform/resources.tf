# Create SSH key to access vms
resource "openstack_compute_keypair_v2" "nkom_ssh_key" {
  name       = "nkom-ssh-key"
  region     = var.region
  public_key = var.public_key
}

# Request external network id
data "openstack_networking_network_v2" "external_net" {
  name = "external-network"
}

# Create router to access external network
resource "openstack_networking_router_v2" "router_1" {
  name                = "router-1"
  external_network_id = data.openstack_networking_network_v2.external_net.id
}

# Create private network
resource "openstack_networking_network_v2" "private_net" {
  name = "private-net"
}

# Create private subnet
resource "openstack_networking_subnet_v2" "private_net_subnet" {
  network_id = openstack_networking_network_v2.private_net.id
  name       = "private-net-subnet"
  cidr       = var.subnet_cidr
}

# Connect private subnet to router for access to external resources
resource "openstack_networking_router_interface_v2" "router_interface_private_net_subnet" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.private_net_subnet.id
}

# Create network boot disk
resource "openstack_blockstorage_volume_v3" "volume" {
  count = length(var.vms)
  name                 = "volume-${var.vms[count.index]}"
  size                 = var.volume_size[count.index]
  image_id             = data.openstack_images_image_v2.os_image.id
  volume_type          = "${var.volume_type[count.index]}.${var.az_zone}"
  availability_zone    = var.az_zone
  enable_online_resize = true
  lifecycle {
    ignore_changes = [image_id]
  }
}

# Create vm
resource "openstack_compute_instance_v2" "vm" {
  count = length(var.vms)
  name              = var.vms[count.index]
  flavor_id         = var.vm_flavor[count.index]
  key_pair          = openstack_compute_keypair_v2.nkom_ssh_key.id
  availability_zone = var.az_zone
  network {
    uuid = openstack_networking_network_v2.private_net.id
  }
  block_device {
    uuid             = openstack_blockstorage_volume_v3.volume[count.index].id
    source_type      = "volume"
    destination_type = "volume"
    boot_index       = 0
  }
  vendor_options {
    ignore_resize_confirmation = true
  }
  lifecycle {
    ignore_changes = [image_id]
  }
}

# Create public IP
resource "openstack_networking_floatingip_v2" "public_ip" {
  count = length(var.vms_public)
  pool = "external-network"
}

# Привязка публичного IP-адреса к серверу
resource "openstack_compute_floatingip_associate_v2" "public_ip" {
  count = length(var.vms_public)
  floating_ip = openstack_networking_floatingip_v2.public_ip[count.index].address
  instance_id = openstack_compute_instance_v2.vm[index(var.vms, var.vms_public[count.index])].id
}

# generate ansible inventory
resource "local_file" "inventory" {
  content  = templatefile("templates/inventory.tftpl", 
  {
    ipv4_public=openstack_networking_floatingip_v2.public_ip[*].address, 
    hostname=openstack_compute_instance_v2.vm[*].name
  })
  filename = "${path.module}/../ansible/inventory.yaml"
}
