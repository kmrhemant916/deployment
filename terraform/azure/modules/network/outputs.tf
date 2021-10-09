output "virtual_networks" {
  value = {
    for vnet in azurerm_virtual_network.this:
      vnet.name => tomap({
                  "id" = vnet.id
                  "name" = vnet.name})
  }
}

output "azurerm_subnets" {
  value = {
    for subnet in azurerm_subnet.this:
      subnet.name => tomap({
                  "id" = subnet.id
                  "name" = subnet.name})
  }
}