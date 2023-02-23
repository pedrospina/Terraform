resource "oci_core_security_list" "WebSecurityList_prueba" {
    compartment_id = oci_identity_compartment.Compartment.id
    display_name = "WebSecurityList_prueba"
    vcn_id = oci_core_virtual_network.VCN.id
    
    egress_security_rules {
        protocol = "6"
        destination = "0.0.0.0/0"
    }
    
    dynamic "ingress_security_rules" {
    for_each = var.webservice_ports
    content {
        protocol = "6"
        source = "0.0.0.0/0"
        tcp_options {
            max = ingress_security_rules.value
            min = ingress_security_rules.value
            }
        }
    }

    ingress_security_rules {
        protocol = "6"
        source = var.VCN-CIDR
    }
}

resource "oci_core_security_list" "SSHSecurityList_prueba" {
    compartment_id = oci_identity_compartment.Compartment.id
    display_name = "SSHSecurityList_prueba"
    vcn_id = oci_core_virtual_network.VCN.id
    
    egress_security_rules {
        protocol = "6"
        destination = "0.0.0.0/0"
    }
    
    dynamic "ingress_security_rules" {
    for_each = var.bastion_ports
    content {
        protocol = "6"
        source = "0.0.0.0/0"
        tcp_options {
            max = ingress_security_rules.value
            min = ingress_security_rules.value
            }
        }
    }

    ingress_security_rules {
        protocol = "6"
        source = var.VCN-CIDR
    }
}
