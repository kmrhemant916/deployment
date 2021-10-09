storage_account_params = {
    dev3a1mars = {
        resource_group_name       = "a1-mars"
        storage_prefix            = "dev3a1mars"
        location                  = "eastus"
        account_tier              = "Standard"
        account_replication_type  = "LRS"
        allow_blob_public_access  = "false"
        account_kind              = "StorageV2"
        cors_rule           = [
            {
                allowed_headers = ["*"]
                allowed_methods = [ "GET", "POST", "PUT", "OPTIONS" ]
                allowed_origins = ["*"]
                exposed_headers = ["*"]
                max_age_in_seconds = 200
            }
        ]
        tags                      = {
            "env"                 = "dev"
        }
    }
    dev3a1static = {
        resource_group_name       = "a1-mars"
        storage_prefix            = "dev3a1static"
        location                  = "eastus"
        account_tier              = "Standard"
        account_replication_type  = "LRS"
        allow_blob_public_access  = "true"
        account_kind              = "StorageV2"
        cors_rule                 = []
        tags                      = {
            "env"                 = "dev"
        }
    }
}

storage_container_params = {
    viewers = {
        name                      = "viewers"
        storage_account_name      = "dev3a1static"
        container_access_type     = "blob"
    }
}

cdn_profile_params = {
    dev3a1static = {
        name                = "dev3a1static"
        location            = "eastus"
        resource_group_name = "a1-mars"
        sku                 = "Standard_Microsoft"
        tags                = {
            "env"           = "dev"
        }
    }
}

cdn_endpoint_params = {
    dev3a1static = {
        name                = "dev3a1static"
        location            = "eastus"
        resource_group_name = "a1-mars"
        profile_name        = "dev3a1static"
        origin = [
            {
                name        = "dev3a1static"
                host_name   = "dev3a1static.blob.core.windows.net"
            },
        ]
    }
}

dns_cname_record_params = {
    "dev3.az" = {
        name                     = "dev3.az"
        zone_name                = "altairone.com"
        resource_group_name      = "dns"
        ttl                      = 300
        record                   = "ingress.a1-mars.az.altairone.com"
    }
    "*.dev3.az" = {
        name                     = "*.dev3.az"
        zone_name                = "altairone.com"
        resource_group_name      = "dns"
        ttl                      = 300
        record                   = "ingress.a1-mars.az.altairone.com"
    }
    "*.app.dev3.az" = {
        name                     = "*.app.dev3.az"
        zone_name                = "altairone.com"
        resource_group_name      = "dns"
        ttl                      = 300
        record                   = "ingress.a1-mars.az.altairone.com"
    }
}