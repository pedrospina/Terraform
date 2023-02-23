resource "oci_core_instance_configuration" "WebserverInstanceConfiguration_prueba" {
    compartment_id = oci_identity_compartment.Compartment.id
    display_name = "InstanceWebserverConfiguration_prueba"
    instance_id = oci_core_instance.Webserver.id
    source = "INSTANCE"
}


