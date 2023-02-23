resource "oci_core_virtual_network" "VCN" {
  cidr_blocks    = var.VCN-CIDRs
  dns_label      = "VCN"
  compartment_id = oci_identity_compartment.Compartment.id
  display_name   = "VCN"
}

resource "oci_core_subnet" "BackendSubnet_prubea" {
  cidr_block                 = var.BackendSubnet-CIDR
  display_name               = "BackendSubnet_prueba"
  dns_label                  = "CCCN2"
  compartment_id             = oci_identity_compartment.Compartment.id
  vcn_id                     = oci_core_virtual_network.VCN.id
  route_table_id             = oci_core_route_table.RouteTableViaNAT.id
  dhcp_options_id            = oci_core_dhcp_options.DhcpOptions1.id
  security_list_ids          = [oci_core_security_list.SecurityList2.id]
  prohibit_public_ip_on_vnic = true
}

resource "oci_core_subnet" "WebSubnet_prueba" {
  cidr_block        = var.WebSubnet-CIDR
  display_name      = "WebSubnet_prueba"
  dns_label         = "CCCN1"
  compartment_id    = oci_identity_compartment.Compartment.id
  vcn_id            = oci_core_virtual_network.VCN.id
  route_table_id    = oci_core_route_table.RouteTableViaIGW.id
  dhcp_options_id   = oci_core_dhcp_options.DhcpOptions1.id
  security_list_ids = [oci_core_security_list.SecurityList1.id]
}
