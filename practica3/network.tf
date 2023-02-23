resource "oci_core_virtual_network" "VCN_prueba" {
  cidr_block = var.VCN-CIDR
  dns_label = "VCN_prueba"
  compartment_id = oci_identity_compartment.CCCCompartment.id
  display_name = "VCN_prueba"
}

resource "oci_core_subnet" "WebSubnet" {
  cidr_block = "10.0.1.0/24"
  display_name = "WebSubnet"
  dns_label = "N2"
  compartment_id = oci_identity_compartment.Compartment.id
  vcn_id = oci_core_virtual_network.VCN.id
  route_table_id = oci_core_route_table.RouteTableViaNAT.id
  dhcp_options_id = oci_core_dhcp_options.DhcpOptions1.id
}

resource "oci_core_subnet" "LBSubnet" {
  cidr_block = "10.0.2.0/24"
  display_name = "LBSubnet_prueba"
  dns_label = "N1_prueba"
  compartment_id = oci_identity_compartment.Compartment.id
  vcn_id = oci_core_virtual_network.VCN.id
  route_table_id = oci_core_route_table.RouteTableViaIGW.id
  dhcp_options_id = oci_core_dhcp_options.DhcpOptions1.id
}

resource "oci_core_subnet" "BastionSubnet_prueba" {
  cidr_block = "10.0.3.0/24"
  display_name = "BastionSubnet_prueba"
  dns_label = "N3_prueba"
  compartment_id = oci_identity_compartment.Compartment.id
  vcn_id = oci_core_virtual_network.VCN.id
  route_table_id = oci_core_route_table.RouteTableViaIGW.id
  dhcp_options_id = oci_core_dhcp_options.DhcpOptions1.id
}


