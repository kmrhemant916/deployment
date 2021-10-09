resource "azurerm_storage_account" "this" {
  for_each                 = var.storage_account_params
  name                     = each.value.storage_prefix
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = coalesce(each.value.account_tier, "Premium")
  account_replication_type = coalesce(each.value.account_replication_type, "LRS")
  allow_blob_public_access = coalesce(each.value.allow_blob_public_access, "false")
  account_kind             = coalesce(each.value.account_kind, "StorageV2")
  blob_properties {
    dynamic "cors_rule" {
      iterator = p
      for_each = length(each.value.cors_rule) != 0 ? each.value.cors_rule : []
      content {
        allowed_headers    = p.value.allowed_headers
        allowed_methods    = p.value.allowed_methods
        allowed_origins    = p.value.allowed_origins
        exposed_headers    = p.value.exposed_headers
        max_age_in_seconds = p.value.max_age_in_seconds
      }
    }
  }
  tags                     = each.value.tags
}

resource "azurerm_management_lock" "this" {
  depends_on = [azurerm_storage_account.this]
  for_each   = var.storage_account_params
  name       = "DeleteLock"
  scope      = azurerm_storage_account.this[each.value.storage_prefix].id
  lock_level = "CanNotDelete"
  notes      = "Locked because it's sensitive"
}

resource "azurerm_storage_container" "this" {
  depends_on            = [azurerm_storage_account.this]
  for_each              = var.storage_container_params
  name                  = each.value.name
  storage_account_name  = each.value.storage_account_name
  container_access_type = each.value.container_access_type
}