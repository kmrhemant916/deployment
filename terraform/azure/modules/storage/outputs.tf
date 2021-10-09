// output "storage_accounts" {
//   value = { for stor in azurerm_storage_account.this:
//     stor.name => {"name": stor.name, "location": stor.location, "resource_group": stor.resource_group_name}
//   }
// }

output "storage_accounts" {
  value = {
    for stor in azurerm_storage_account.this:
      stor.name => tomap({
                  "id" = stor.id
                  "name" =  stor.name
                  "resource_group" = stor.resource_group_name})
  }
}