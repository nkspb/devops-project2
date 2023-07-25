# Get image for requested OS
data "openstack_images_image_v2" "os_image" {
  most_recent = true
  visibility  = "public"
  name        = var.image
}

data "openstack_compute_flavor_v2" "small" {
  vcpus = 2
  ram   = 4096
  name = "SL1.2-4096"
}