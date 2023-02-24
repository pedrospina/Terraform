resource "oci_core_nat_gateway" "NATGateway_prueba" {
  compartment_id = var.compartment_ocid
  display_name   = "NATGateway_prueba"
  vcn_id         = oci_core_virtual_network.VCN.id
}
