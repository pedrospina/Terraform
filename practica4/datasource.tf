# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}

data "oci_core_images" "InstanceImageOCID" {
  compartment_id           = var.compartment_ocid
  operating_system         = var.instance_os
  operating_system_version = var.linux_os_version

  filter {
    name   = "display_name"
    values = ["^.*Oracle[^G]*$"]
    regex  = true
  }
}

data "oci_core_vnic_attachments" "BastionServer_VNIC1_attach_prueba" {
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name")
  compartment_id = oci_identity_compartment.Compartment.id
  instance_id = oci_core_instance.BastionServer.id
}

data "oci_core_vnic" "BastionServer_VNIC1_prueba" {
  vnic_id = data.oci_core_vnic_attachments.BastionServer_VNIC1_attach.vnic_attachments.0.vnic_id
}

data "oci_core_vnic_attachments" "Webserver_VNIC1_attach_prueba" {
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name")
  compartment_id = oci_identity_compartment.Compartment.id
  instance_id = oci_core_instance.Webserver.id
}

data "oci_core_vnic" "Webserver_VNIC1_prueba" {
  vnic_id = data.oci_core_vnic_attachments.Webserver_VNIC1_attach.vnic_attachments.0.vnic_id
}

data "oci_core_instance_pool" "InstancePool_prueba" {
    instance_pool_id = oci_core_instance_pool.InstancePool.id
}

data "oci_core_instance_pool_instances" "InstancePoolInstances_prueba" {
    compartment_id = oci_identity_compartment.Compartment.id
    instance_pool_id = oci_core_instance_pool.InstancePool.id
}