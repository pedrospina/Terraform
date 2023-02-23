locals {

        default_freeform_tags = {
         terraformed = "please do not edit  manually"
         module = "oracle-terraform-modules/compartment/oci"
 }

        #merged
        merged_freeform_tags= merge(local.default_freeform_tags, var.freeform_tags)
}

resource "oci_identity_compartment" "main" {
#Required
compartment_id = data.oci_identity_compartments_tech.compartments[0].i
description = "Este es el primer compartment"
name = var.cmp_name


#Optional
freeform_tags = local.merged_freeform_tags

}

