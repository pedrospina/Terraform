resource "oci_kms_vault" "test_vault" {
    #Required
    compartment_id = var.compartment_id
    display_name = var.display_name
    vault_type = var.vault_type

}