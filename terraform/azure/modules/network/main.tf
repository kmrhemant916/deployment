resource "azurerm_virtual_network" "this" {
  for_each             = var.virtual_network_params
  name                 = each.value.name
  location             = each.value.location
  resource_group_name  = each.value.resource_group_name
  address_space        = each.value.address_spaces
  tags                 = each.value.tags
}

resource "azurerm_subnet" "this" {
  depends_on           = [azurerm_virtual_network.this]
  for_each             = var.subnet_params
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes
}