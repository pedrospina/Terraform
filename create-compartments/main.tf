module "comp_workshop" {
   source ="../modules/compartment"
    
   cmp_id = var.tenancy_ocid
   cmp_name = var.name
   cmp_parent_name = var.parent_name
}

