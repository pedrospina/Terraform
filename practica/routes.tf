resource "oci_core_route_table" "RouteTableViaIGW_prueba" {
  compartment_id = oci_identity_compartment.Compartment.id
  vcn_id         = oci_core_virtual_network.VCN.id
  display_name   = "RouteTableViaIGW_prueba"
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.InternetGateway.id
  }
}

resource "oci_core_route_table" "RouteTableViaNAT_prueba" {
  compartment_id = oci_identity_compartment.Compartment.id
  vcn_id         = oci_core_virtual_network.VCN.id
  display_name   = "RouteTableViaNAT_prueba"
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.NATGateway.id
  }
}
