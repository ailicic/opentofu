# variable "subscription_id" {
#   description = "The subscription ID where the resources will be created"
#   type        = string
# }

variable "tenant_id" {
  description = "The tenant ID where the resources will be created"
  type        = string
}

variable "aks" {
  description = "aks properties"

  type = object({
    default_node_pool = object({
      vm_size   = string
      min_count = number
      max_count = number
    })
    user_node_pool = object({
      vm_size   = string
      min_count = number
      max_count = number
    })
    version = object({
      control_plane = string
      node_pool     = string
    })
  })
  default = {
    default_node_pool = {
      vm_size   = "Standard_B2s_v2"
      min_count = 1
      max_count = 1
    }

    user_node_pool = {
      vm_size   = "Standard_B2s_v2"
      min_count = 1
      max_count = 1
    }

    version = {
      control_plane = "1.31.8"
      node_pool     = "1.31.8"
    }
  }
}