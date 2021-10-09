variable "virtual_network_params" {
  description = "Placeholder for the parameters of the virtual network"
  type = map(object({
    name                = string
    location            = string
    address_spaces      = list(string)
    resource_group_name = string
    tags                = map(string)
  }))
}

// variable "resource_group_names" {
//   description = "Placeholder for the parameters of the resource group"
//   type = map(string)
// }

variable "subnet_params" {
  description = "Placeholder for the parameters of the subnet"
  type = map(object({
    name                = string
    vnet_name           = string
    resource_group_name = string
    address_prefixes    = list(string)
  }))
}