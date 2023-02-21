data "oci_identity_compartments" "tech" {

  #requerid 
  compartment_id = var.tenancy_ocid
  #optional
  name = "OCS-TECH-LAD"

}
