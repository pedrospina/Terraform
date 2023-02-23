resource "oci_autoscaling_auto_scaling_configuration" "ThresholdAutoScalingConfiguration_prueba" {
    auto_scaling_resources {

        id = oci_core_instance_pool.InstancePool.id
        type = "instancePool"
    }
    compartment_id = oci_identity_compartment.Compartment.id
    
    policies {
        display_name = "ThresholdAutoScalingConfigurationPolicies_prueba"
        capacity {
            initial = "2"
            max = "4"
            min = "2"
        }

        policy_type = "threshold"
        
        rules {
            action {
                type = "CHANGE_COUNT_BY"
                value = "1"
            }
            display_name = "ThresholdAutoScalingConfigurationPoliciesScaleOutRule_prueba"
            metric {
                metric_type = "CPU_UTILIZATION"
                threshold {
                    operator = "GT"
                    value = "30"
                }
            }
        }

        rules {
            action {
                type  = "CHANGE_COUNT_BY"
                value = "-1"
            }
            display_name = "ThresholdAutoScalingConfigurationPoliciesScaleInRule_prueba"
            metric {
                metric_type = "CPU_UTILIZATION"
                threshold {
                    operator = "LT"
                    value = "10"
                }
            }
        }
    }
    cool_down_in_seconds = "300"
    display_name = "ThresholdAutoScalingConfiguration_prueba"
}

/*
resource "oci_autoscaling_auto_scaling_configuration" "ScheduledAutoScalingConfiguration_prueba" {
    auto_scaling_resources {

        id = oci_core_instance_pool.InstancePool.id
        type = "instancePool"
    }
    compartment_id = oci_identity_compartment.Compartment.id
    
    policies {
        display_name = "ScheduledAutoScalingConfigurationScaleOutPolicy_prueba"
        capacity {
            initial = "4"
            max = "4"
            min = "2"
        }
        policy_type = "scheduled"
        execution_schedule {
            # 12:00, 28/09/2020
            expression = "0 0 12 28 9 ? 2020"
            timezone   = "UTC"
            type       = "cron"
        }

    }

    policies {
        display_name = "ScheduledAutoScalingConfigurationScaleInPolicy_prueba"
        capacity {
            initial = "2"
            max = "2"
            min = "2"
        }
        policy_type = "scheduled"
        execution_schedule {
            # 12:15, 28/09/2020
            expression = "0 15 12 28 9 ? 2020"
            timezone   = "UTC"
            type       = "cron"
        }

    }

    cool_down_in_seconds = "300"
    display_name = "ScheduledAutoScalingConfiguration_prueba"
}
*/
