resource "oci_core_dhcp_options" "DhcpOptions1_prueba" {
  compartment_id = oci_identity_compartment.Compartment.id
  vcn_id = oci_core_virtual_network.VCN.id
  display_name = "DHCPOptions1_prueba"

  // required
  options {
    type = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  // optional
  options {
    type = "SearchDomain"
    search_domain_names = [ "demo.com" ]
  }
}
