resource "oci_core_nat_gateway" "NATGateway_prueba" {
  compartment_id = oci_identity_compartment.Compartment.id
  display_name   = "NATGateway_prueba"
  vcn_id         = oci_core_virtual_network.VCN.id
}
