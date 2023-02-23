resource "oci_load_balancer_load_balancer" "PublicLoadBalancer_prueba" {
  compartment_id = oci_identity_compartment.Compartment.id 
  
  display_name   = "FlexPublicLB_prueba"
  subnet_ids     = [
    oci_core_subnet.LBSubnet.id
  ]

  shape          = "flexible"
  shape_details {
    minimum_bandwidth_in_mbps = 10
    maximum_bandwidth_in_mbps = 100
  }

}

resource "oci_load_balancer_backendset" "PublicLoadBalancerBackendset_prueba" {
  name             = "PublicLBBackendset_prueba"
  load_balancer_id = oci_load_balancer_load_balancer.PublicLoadBalancer.id
  policy           = "ROUND_ROBIN"

  health_checker {
    port     = "80"
    protocol = "HTTP"
    response_body_regex = ".*"
    url_path = "/"
    interval_ms = "3000"
  }
}


resource "oci_load_balancer_listener" "PublicLoadBalancerListener_prueba" {
  load_balancer_id         = oci_load_balancer_load_balancer.PublicLoadBalancer.id
  name                     = "PublicLoadBalancerListener_prueba"
  default_backend_set_name = oci_load_balancer_backendset.PublicLoadBalancerBackendset.name
  port                     = 80
  protocol                 = "HTTP"
}


resource "oci_load_balancer_backend" "PublicLoadBalancerBackend_prueba" {
  load_balancer_id = oci_load_balancer_load_balancer.PublicLoadBalancer.id
  backendset_name  = oci_load_balancer_backendset.PublicLoadBalancerBackendset.name
  ip_address       = oci_core_instance.Webserver.private_ip
  port             = 80 
  backup           = false
  drain            = false
  offline          = false
  weight           = 1
}



