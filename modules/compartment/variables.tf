variable "cmp_id" {
        description = "(Required) (Updatable) The description you assign to the compartment during creation. Does not have to be unique, and it's changeable."
        type = string
}

variable "cmp_name" {
        description = "(Required) (Updatable) Nombre del compartment padre donde se va a crear el compartment hijo The name you assign to the compartment during creation. The name must be unique across all compartments in the parent compartment. Avoid entering confidential information."
        type = string
}

variable "cmp_parent_name" {

description = "(requeried) nombre del compartment padre donde se va crear el compartment hijo"
type = string
}

# optional input parameter for module
variable "freeform_tags" {
        description  = " (Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see Resource Tags."
        type = map(string)
        default = null
}