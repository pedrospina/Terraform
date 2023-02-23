resource "oci_identity_compartment" "Compartment_prueba" {
  name = "Compartment"
  description = "Prueba Compartment"
  compartment_id = var.compartment_ocid
}