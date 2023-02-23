output "PublicLoadBalancer_Public_IP_prueba" {
  value = [oci_load_balancer_load_balancer.PublicLoadBalancer.ip_addresses]
}

output "BastionServer_PublicIP_prueba" {
   value = [data.oci_core_vnic.BastionServer_VNIC1.public_ip_address]
}

output "Webserver_PrivateIP_prueba" {
   value = [data.oci_core_vnic.Webserver_VNIC1.private_ip_address]
}

output "InstancePool_size_prueba" {
   value = data.oci_core_instance_pool.InstancePool.size
}

output "InstancePool_instances_prueba" {
   value = data.oci_core_instance_pool_instances.InstancePoolInstances.instances.*.display_name
}

output "generated_ssh_private_key" {
  value = tls_private_key.public_private_key_pair.private_key_pem
}