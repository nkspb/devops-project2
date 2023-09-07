# Get image for requested OS
data "openstack_images_image_v2" "os_image" {
  most_recent = true
  visibility  = "public"
  name        = var.image
}
