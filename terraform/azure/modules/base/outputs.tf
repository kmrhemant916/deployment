// output "resource_groups" {
//   value = {
//     for rg in azurerm_resource_group.this:
//       rg.name => rg.id
//   }
// }

output "resource_groups" {
  value = {
    for rg in azurerm_resource_group.this:
      rg.name => tomap({
                  "id" = rg.id
                  "name" =  rg.name})
  }
}


// resource_groups = {
//   "test1" = "/subscriptions/2da5fd81-ee52-47c3-b7b4-a2fe97db421d/resourceGroups/test1"
//   "test2" = "/subscriptions/2da5fd81-ee52-47c3-b7b4-a2fe97db421d/resourceGroups/test2"
// }

// resource_groups = {
//   "test1" = tomap({
//     "id" = "/subscriptions/2da5fd81-ee52-47c3-b7b4-a2fe97db421d/resourceGroups/test1"
//     "name" = "test1"
//   })
//   "test2" = tomap({
//     "id" = "/subscriptions/2da5fd81-ee52-47c3-b7b4-a2fe97db421d/resourceGroups/test2"
//     "name" = "test2"
//   })
// }