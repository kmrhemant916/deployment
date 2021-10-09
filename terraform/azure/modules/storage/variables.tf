variable "storage_account_params" {
  description = "Placeholder for the parameters of the storage"
  type = map(object({
    resource_group_name       = string
    storage_prefix            = string
    location                  = string
    account_tier              = string
    account_replication_type  = string
    allow_blob_public_access  = string
    account_kind              = string
    cors_rule           = list(object({
        allowed_headers     = list(string)
        allowed_methods     = list(string)
        allowed_origins     = list(string)
        exposed_headers     = list(string)
        max_age_in_seconds  = number
    }))
    tags                      = map(string)
  }))
}

variable "storage_container_params" {
  description = "Placeholder for the parameters of the storage container"
  type = map(object({
    name                      = string
    storage_account_name      = string
    container_access_type     = string
  }))
}