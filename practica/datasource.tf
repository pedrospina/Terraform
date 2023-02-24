data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}

data "oci_core_image" "InstanceImageOCID" {
   
   #Required
    image_id = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaeldzz5u45k53bolmztxjhvtcb65fbiexxonnqgwpfe63fonmpz4a"
 # compartment_id           = var.compartment_ocid
 # operating_system         = var.instance_os
 # operating_system_version = var.linux_os_version

  #filter {
  #  name   = "display_name:prueba"
  #  values = ["^.*Oracle[^G]*$"]
  #  regex  = true
 #}
}
