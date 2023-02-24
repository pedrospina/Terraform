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

compartment_id = data.oci_identity_compartments.tech.compartments[0].id
description = "Este es el primer compartment"
name = var.cmp_name
enable_delete = "true"

#Optional
freeform_tags = local.merged_freeform_tags

}

