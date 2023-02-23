resource "oci_core_internet_gateway" "InternetGateway" {
    compartment_id = oci_identity_compartment.Compartment.id
    display_name = "InternetGateway_prueba"
    vcn_id = oci_core_virtual_network.VCN.id
}
