output "storage_accounts" {
  value = module.storage.storage_accounts
}

output "cdn_profiles" {
  value = module.cdn.cdn_profiles
}

output "cdn_endpoints" {
  value = module.cdn.cdn_endpoints
}

output "cname_records" {
  value = module.dns.cname_records
}

output "a_records" {
  value = module.dns.a_records
}

output "private_cname_records" {
  value = module.dns.private_cname_records
}

output "private_a_records" {
  value = module.dns.private_a_records
}