resource "oci_core_virtual_network" "VCN" {
  cidr_blocks    = var.VCN-CIDRs
  dns_label      = "VCN"
  compartment_id = oci_identity_compartment.CCCCompartment.id
  display_name   = "VCN"
}

resource "oci_core_subnet" "BackendSubnet_prubea" {
  cidr_block                 = var.BackendSubnet-CIDR
  display_name               = "BackendSubnet_prueba"
  dns_label                  = "CCCN2"
  compartment_id             = oci_identity_compartment.CCCCompartment.id
  vcn_id                     = oci_core_virtual_network.CCCVCN.id
  route_table_id             = oci_core_route_table.CCCRouteTableViaNAT.id
  dhcp_options_id            = oci_core_dhcp_options.CCCDhcpOptions1.id
  security_list_ids          = [oci_core_security_list.CCCSecurityList2.id]
  prohibit_public_ip_on_vnic = true
}

resource "oci_core_subnet" "WebSubnet_prueba" {
  cidr_block        = var.WebSubnet-CIDR
  display_name      = "WebSubne_prueba"
  dns_label         = "CCCN1"
  compartment_id    = oci_identity_compartment.CCCCompartment.id
  vcn_id            = oci_core_virtual_network.CCCVCN.id
  route_table_id    = oci_core_route_table.CCCRouteTableViaIGW.id
  dhcp_options_id   = oci_core_dhcp_options.CCCDhcpOptions1.id
  security_list_ids = [oci_core_security_list.CCCSecurityList1.id]
}

