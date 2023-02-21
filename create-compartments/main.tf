resource "oci_identity_compartment" "test_compartment" {
  #requerid
  compartment_id = data.oci_identity_compartments.tech.compartments[0].id
  description    = "Este es el primer compartment"
  name           = "lab_workshop_pedro"

  #Optional
  freeform_tags = { "Department" = "Laboratorio" }
}