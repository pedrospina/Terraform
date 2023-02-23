resource "oci_core_virtual_network" "VCN" {
  cidr_block = var.VCN-CIDR
  dns_label = "VCN"
  compartment_id = oci_identity_compartment.Compartment.id
  display_name = "VCN"
}

resource "oci_core_subnet" "WebSubnet_prueba" {
  cidr_block = "10.0.1.0/24"
  display_name = "WebSubnet_prueba"
  dns_label = "N1_prueba"
  compartment_id = oci_identity_compartment.Compartment.id
  vcn_id = oci_core_virtual_network.VCN.id
  route_table_id = oci_core_route_table.RouteTableViaNAT.id
  dhcp_options_id = oci_core_dhcp_options.DhcpOptions1.id
  security_list_ids = [oci_core_security_list.WebSecurityList.id,oci_core_security_list.CCCSSHSecurityList.id]
}

resource "oci_core_subnet" "LBSubnet_prueba" {
  cidr_block = "10.0.2.0/24"
  display_name = "LBSubnet_prueba"
  dns_label = "N2_prueba"
  compartment_id = oci_identity_compartment.Compartment.id
  vcn_id = oci_core_virtual_network.VCN.id
  route_table_id = oci_core_route_table.RouteTableViaIGW.id
  dhcp_options_id = oci_core_dhcp_options.DhcpOptions1.id
  security_list_ids = [oci_core_security_list.WebSecurityList.id]
}

resource "oci_core_subnet" "BastionSubnet_prueba" {
  cidr_block = "10.0.3.0/24"
  display_name = "BastionSubnet_prueba"
  dns_label = "N3_prueba"
  compartment_id = oci_identity_compartment.Compartment.id
  vcn_id = oci_core_virtual_network.VCN.id
  route_table_id = oci_core_route_table.RouteTableViaIGW.id
  dhcp_options_id = oci_core_dhcp_options.DhcpOptions1.id
  security_list_ids = [oci_core_security_list.SSHSecurityList.id]
}
