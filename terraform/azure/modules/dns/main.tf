resource "azurerm_dns_cname_record" "this" {
  for_each            = var.dns_cname_record_params
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  record              = each.value.record
}

resource "azurerm_dns_a_record" "this" {
  for_each            = var.dns_a_record_params
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records
}

resource "azurerm_private_dns_a_record" "this" {
  for_each            = var.private_dns_a_record_params
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records
}

resource "azurerm_private_dns_cname_record" "this" {
  for_each            = var.private_dns_cname_record_params
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  record              = each.value.records
}