resource "oci_core_virtual_network" "VCN_prueba" {
  cidr_blocks = var.VCN-CIDRs
  dns_label = "VCN"
  compartment_id = oci_identity_compartment.CCCCompartment.id
  display_name = "VCN_prueba"
}

resource "oci_core_subnet" "WebSubnet_prueba" {
  cidr_block = "10.0.1.0/24"
  display_name = "WebSubnet_prueba"
  dns_label = "CCCN1"
  compartment_id = oci_identity_compartment.Compartment.id
  vcn_id = oci_core_virtual_network.VCN.id
  route_table_id = oci_core_route_table.RouteTableViaIGW.id
  dhcp_options_id = oci_core_dhcp_options.DhcpOptions1.id
  security_list_ids = [oci_core_security_list.SecurityList.id]
}