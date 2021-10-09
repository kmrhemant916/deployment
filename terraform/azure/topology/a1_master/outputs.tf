output "resource_groups" {
  value = module.base.resource_groups
}

output "virtual_networks" {
  value = module.network.virtual_networks
}

output "storage_accounts" {
  value = module.storage.storage_accounts
}
