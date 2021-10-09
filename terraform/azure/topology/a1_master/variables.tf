variable "resource_group_params" {
    description = "Placeholder for the parameters of the resource group"
    type = map(object({
        name             = string
        location         = string
        tags             = map(string)
    }))
}

variable "virtual_network_params" {
    description = "Placeholder for the parameters of the virtual network"
    type = map(object({
        name                = string
        location            = string
        resource_group_name = string
        address_spaces      = list(string)
        tags                = map(string)
    }))
}

variable "subnet_params" {
    description = "Placeholder for the parameters of the subnet"
    type = map(object({
        name                = string
        vnet_name           = string
        resource_group_name = string
        address_prefixes    = list(string)
    }))
}

variable "storage_account_params" {
    description = "Placeholder for the parameters of the resource group"
    type = map(object({
        resource_group_name       = string
        storage_prefix            = string
        location                  = string
        account_tier              = string
        account_replication_type  = string
        allow_blob_public_access  = string
        account_kind              = string
        blob_properties           = object({
            cors_rule = object({
                allowed_headers     = list(string)
                allowed_methods     = list(string)
                allowed_origins     = list(string)
                exposed_headers     = list(string)
                max_age_in_seconds  = number
            })
        })
        tags                      = map(string)
    }))
}

variable "cdn_profile_params" {
    description = "Placeholder for the parameters of the CDN profile"
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
    type = map(object({
        name                = string
        zone_name           = string
        resource_group_name = string
        ttl                 = number
        records             = list(string)
    }))
}

// variable "dns_zone_params" {
//     description = "The parameters of the DNS zones: zone_name, resource_group_name"
//     type = map(object({
//         zone_name           = string
//         resource_group_name = string
//     }))
// }