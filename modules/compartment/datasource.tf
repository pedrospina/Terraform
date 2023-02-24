data "oci_identity_compartment" "tech" {

        #Required
        compartment_id = var.cmp_id
        name = var.cmp_name

}