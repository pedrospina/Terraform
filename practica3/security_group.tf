resource "oci_core_network_security_group" "WebSecurityGroup_prueba" {
    compartment_id = oci_identity_compartment.Compartment.id
    display_name = "WebSecurityGroup_prueba"
    vcn_id = oci_core_virtual_network.VCN.id
}

resource "oci_core_network_security_group" "SSHSecurityGroup_prueba" {
    compartment_id = oci_identity_compartment.Compartment.id
    display_name = "SSHSecurityGroup_prueba"
    vcn_id = oci_core_virtual_network.VCN.id
}
