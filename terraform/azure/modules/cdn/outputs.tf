output "cdn_profiles" {
  value = {
    for cdn in azurerm_cdn_profile.this:
      cdn.name => tomap({
                  "id" = cdn.id
                  "name" = cdn.name})
  }
}

output "cdn_endpoints" {
  value = {
    for ep in azurerm_cdn_endpoint.this:
      ep.name => tomap({
                  "id" = ep.id
                  "name" = ep.name})
  }
}