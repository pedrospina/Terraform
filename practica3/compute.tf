resource "oci_core_instance" "Webserver_prueba" {
  count = var.NumberOfNodes
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name")
  compartment_id = oci_identity_compartment.Compartment.id
  display_name = "WebServer${count.index+1}"
  shape = "VM.Standard.E3.Flex"
  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.InstanceImageOCID.images[0].id
  }
  metadata = {
      ssh_authorized_keys = tls_private_key.public_private_key_pair.public_key_openssh
  }
  create_vnic_details {
     subnet_id = oci_core_subnet.WebSubnet.id
     assign_public_ip = false
     nsg_ids = [oci_core_network_security_group.WebSecurityGroup.id]
  }
  shape_config {
      memory_in_gbs = 2
      ocpus = 1
  }
}


resource "oci_core_instance" "BastionServer" {
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name")
  compartment_id = oci_identity_compartment.Compartment.id
  display_name = "BastionServer"
  shape = "VM.Standard.E3.Flex"
  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.InstanceImageOCID.images[0].id
  }
  metadata = {
      ssh_authorized_keys = tls_private_key.public_private_key_pair.public_key_openssh
  }
  create_vnic_details {
     subnet_id = oci_core_subnet.BastionSubnet.id
     assign_public_ip = true
     nsg_ids = [oci_core_network_security_group.SSHSecurityGroup.id]
  }
  shape_config {
      memory_in_gbs = 1
      ocpus = 1
  }
}