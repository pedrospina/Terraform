resource "oci_core_internet_gateway" "InternetGateway_prueba" {
    compartment_id = oci_identity_compartment.Compartment.id
    display_name = "InternetGateway"
    vcn_id = oci_core_virtual_network.VCN.id
}
