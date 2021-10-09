resource "azurerm_cdn_profile" "this" {
  for_each            = var.cdn_profile_params
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku
  tags                = each.value.tags
}

resource "azurerm_cdn_endpoint" "this" {
  depends_on          = [azurerm_cdn_profile.this]
  for_each            = var.cdn_endpoint_params
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  profile_name        = each.value.profile_name
  dynamic "origin" {
    iterator = cdn
    for_each = each.value.origin
    content {
      name       = cdn.value.name
      host_name  = cdn.value.host_name
    }
  }
}