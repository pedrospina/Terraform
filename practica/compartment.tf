resource "oci_identity_compartment" "Prueba" {
  name           = "Pruebas_OCI"
  description    = "CCC Compartment"
  compartment_id = var.compartment_ocid
}