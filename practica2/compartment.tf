resource "oci_identity_compartment" "Compartment_prueba" {
  name = "Compartment_prueba"
  description = "Prueba Compartment"
  compartment_id = var.compartment_ocid
}

