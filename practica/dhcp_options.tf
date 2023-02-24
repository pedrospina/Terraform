resource "oci_core_dhcp_options" "DhcpOptions1_prueba" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.VCN.id
  display_name   = "DHCPOptions1_prueba"

  // required
  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  options {
    type                = "SearchDomain"
    search_domain_names = ["cccdemo.com"]
  }
}
