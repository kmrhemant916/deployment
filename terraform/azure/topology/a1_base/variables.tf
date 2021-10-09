variable "storage_account_params" {
    description = "Placeholder for the parameters of the storage"
    default = {}
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
    default = {}
    type = map(object({
        name                      = string
        storage_account_name      = string
        container_access_type     = string
    }))
}

variable "cdn_profile_params" {
    description = "Placeholder for the parameters of the CDN profile"
    default = {}
    type = map(object({
        name                = string
        location            = string
        resource_group_name = string
        sku                 = string
        tags                = map(string)
    }))
}

variable "cdn_endpoint_params" {
    description = "Placeholder for the parameters of the CDN endpoint"
    default = {}
    type = map(object({
        name                = string
        location            = string
        resource_group_name = string
        profile_name        = string
        origin = list(object({
            name = string
            host_name    = string
        }))
    }))
}

variable "dns_cname_record_params" {
    description = "Placeholder for the parameters of the DNS CNAME record"
    default = {}
    type = map(object({
        name                = string
        zone_name           = string
        resource_group_name = string
        ttl                 = number
        record              = string
    }))
}

variable "dns_a_record_params" {
    description = "Placeholder for the parameters of the DNS A record"
    default = {}
    type = map(object({
        name                = string
        zone_name           = string
        resource_group_name = string
        ttl                 = number
        records             = list(string)
    }))
}

variable "private_dns_a_record_params" {
    description = "Placeholder for the parameters of the private DNS A record"
    default = {}
    type = map(object({
        name                = string
        zone_name           = string
        resource_group_name = string
        ttl                 = number
        records             = list(string)
    }))
}

variable "private_dns_cname_record_params" {
    description = "Placeholder for the parameters of the private DNS CNAME record"
    default = {}
    type = map(object({
        name                = string
        zone_name           = string
        resource_group_name = string
        ttl                 = number
        records             = string
    }))
}