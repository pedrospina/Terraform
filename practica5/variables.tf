variable compartment_id {
    description = "(Required) (Updatable) The OCID of the compartment where you want to create this vault"
    default = "ocid1.compartment.oc1..aaaaaaaa7lgfrrpo3awm24dxnnz54khj77krfx23lbnyzr6p2quscyylv5oa"
}

variable display_name {
    description = "(Required) (Updatable) A user-friendly name for the vault. It does not have to be unique, and it is changeable. Avoid entering confidential information."    
    default = "vault_prueba"
}

variable vault_type {
    description = "(Required) The type of vault to create. Each type of vault stores the key with different degrees of isolation and has different options and pricing."
    default = "DEFAULT"
} 