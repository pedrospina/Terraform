resource "oci_load_balancer" "FlexPublicLoadBalancer_prueba" {
  compartment_id = oci_identity_compartment.Compartment.id 
  
  display_name   = "FlexPublicLB_prueba"
  network_security_group_ids = [oci_core_network_security_group.WebSecurityGroup.id]
  
  subnet_ids     = [
    oci_core_subnet.LBSubnet.id
  ]

  #shape           = "10Mbps"
  shape          = "flexible"
  shape_details {
    minimum_bandwidth_in_mbps = 10
  #  maximum_bandwidth_in_mbps = 100
    maximum_bandwidth_in_mbps = 1000
  }
}

resource "oci_load_balancer_backendset" "FlexPublicLoadBalancerBackendset_prueba" {
  name             = "FlexLBBackendset_prueba"
  load_balancer_id = oci_load_balancer.FlexPublicLoadBalancer.id
  policy           = "ROUND_ROBIN"

  health_checker {
    port     = "80"
    protocol = "HTTP"
    response_body_regex = ".*"
    url_path = "/"
  }
}


resource "oci_load_balancer_listener" "FlexPublicLoadBalancerListener_prueba" {
  load_balancer_id         = oci_load_balancer.CCCFlexPublicLoadBalancer.id
  name                     = "FlexLBListener_prueba"
  default_backend_set_name = oci_load_balancer_backendset.FlexPublicLoadBalancerBackendset.name
  port                     = 80
  protocol                 = "HTTP"
}


resource "oci_load_balancer_backend" "FlexPublicLoadBalancerBackend1" {
  count            = var.NumberOfNodes
  load_balancer_id = oci_load_balancer.FlexPublicLoadBalancer.id
  backendset_name  = oci_load_balancer_backendset.FlexPublicLoadBalancerBackendset.name
  ip_address       = oci_core_instance.Webserver[count.index].private_ip
  port             = 80 
  backup           = false
  drain            = false
  offline          = false
  weight           = 1
}

output "FlexPublicLoadBalancer_Public_IP_prueba" {
  value = [oci_load_balancer.CCCFlexPublicLoadBalancer.ip_addresses]
}

