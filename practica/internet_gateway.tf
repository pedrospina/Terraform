resource "oci_core_internet_gateway" "InternetGateway_prueba" {
  compartment_id = oci_identity_compartment.CCCCompartment.id
  display_name   = "InternetGateway_prueba"
  vcn_id         = oci_core_virtual_network.CCCVCN.id
}
