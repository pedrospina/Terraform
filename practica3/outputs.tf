output "Webservers_PrivateIP_prueba" {
   value = data.oci_core_vnic.CCCWebserver_VNIC1.*.private_ip_address
}

output "BastionServer_PublicIP_prueba" {
   value = [data.oci_core_vnic.CCCBastionServer_VNIC1.public_ip_address]
}

output "generated_ssh_private_key_prueba" {
  value = tls_private_key.public_private_key_pair.private_key_pem
}
