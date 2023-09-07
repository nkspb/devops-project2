output "vm_uuid" {
    value = openstack_compute_instance_v2.vm[*].id
}

output "vm_private_ip" {
    value = openstack_compute_instance_v2.vm[*].access_ip_v4
}

output "vm_public_ip" {
    value = openstack_compute_floatingip_associate_v2.public_ip[*].floating_ip
}
