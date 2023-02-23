resource "oci_core_instance_pool" "InstancePool_prueba" {
    compartment_id = oci_identity_compartment.Compartment.id
    instance_configuration_id = oci_core_instance_configuration.WebserverInstanceConfiguration.id  
    placement_configurations {
        availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name")
        primary_subnet_id = oci_core_subnet.WebSubnet.id

    }
    size = "2"
    display_name = "InstancePool_prueba"
    load_balancers {
        backend_set_name = oci_load_balancer_backendset.PublicLoadBalancerBackendset.name
        load_balancer_id = oci_load_balancer_load_balancer.PublicLoadBalancer.id
        port = "80"
        vnic_selection = "PrimaryVnic"
    }
}