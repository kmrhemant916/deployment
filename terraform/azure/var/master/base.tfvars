resource_group_params = {
    test1 = {
        name             = "test1"
        location         = "eastus2"
        tags             = {
            "env"        = "dev" 
        }
    }
    test2 = {
        name             = "test2"
        location         = "eastus2"
        tags             = {
            "env"        = "dev" 
        }
    }
}

virtual_network_params = {
    dev1 = {
        name                = "dev1"
        location            = "eastus2"
        address_spaces      = ["10.1.0.0/16"]
        resource_group_name = "test1"
        tags                = {
            "env"           = "dev" 
        }
    }
    dev2 = {
        name                = "dev2"
        location            = "eastus2"
        address_spaces      = ["10.0.0.0/16"]
        resource_group_name = "test2"
        tags                = {
            "env"           = "dev" 
        }
    }
}

subnet_params = {
    subnet1 = {
        name                = "sub1"
        vnet_name           = "dev1"
        resource_group_name = "test1"
        address_prefixes    = ["10.1.1.0/24"]
    }
    subnet2 = {
        name                = "sub2"
        vnet_name           = "dev2"
        resource_group_name = "test2"
        address_prefixes    = ["10.0.6.0/23"]
    }
}

storage_account_params = {
    dma1static1 = {
        resource_group_name       = "test1"
        storage_prefix            = "dma1static1"
        location                  = "eastus2"
        account_tier              = "Standard"
        account_replication_type  = "LRS"
        allow_blob_public_access  = "false"
        account_kind              = "StorageV2"
        tags                      = {
            "env"                 = "dev"
        }
    }
    dma1static2 = {
        resource_group_name       = "test2"
        storage_prefix            = "dma1static2"
        location                  = "eastus2"
        account_tier              = "Standard"
        account_replication_type  = "LRS"
        allow_blob_public_access  = "false"
        account_kind              = "StorageV2"
        tags                      = {
            "env"                 = "dev"
        }
    }
}

cdn_profile_params = {
    cp1 = {
        name                = "cp1"
        location            = "eastus2"
        resource_group_name = "test1"
        sku                 = "Standard_Microsoft"
        tags                = {
            "env"           = "dev"
        }
    }
    cp2 = {
        name                = "cp2"
        location            = "eastus2"
        resource_group_name = "test2"
        sku                 = "Standard_Microsoft"
        tags                = {
            "env"           = "dev"
        }
    }
}

cdn_endpoint_params = {
    ce1 = {
        name                = "ce1"
        location            = "eastus2"
        resource_group_name = "test1"
        profile_name        = "cp1"
        origin = [
            {
                name        = "dma1static1"
                host_name   = "dma1static1.blob.core.windows.net"
            },
        ]
    }
    ce2 = {
        name                = "ce2"
        location            = "eastus2"
        resource_group_name = "test2"
        profile_name        = "cp2"
        origin = [
            {
                name        = "dma1static2"
                host_name   = "dma1static2.blob.core.windows.net"
            },
        ]
    }
}

// dns_zone_params = {
//     "altair1.com" = {
//         zone_name                = "altairone.com"
//         resource_group_name      = "dns"
//     }
// }

dns_cname_record_params = {
    testhem5 = {
        name                     = "testhem1.az"
        zone_name                = "altairone.com"
        resource_group_name      = "dns"
        ttl                      = 60
        record                   = "testhem5.az"
    }
    testhem6 = {
        name                     = "testhem2.az"
        zone_name                = "altairone.com"
        resource_group_name      = "dns"
        ttl                      = 60
        record                   = "testhem6.az"
    }
}

dns_a_record_params = {
    testhem5 = {
        name                     = "testhem5.az"
        zone_name                = "altairone.com"
        resource_group_name      = "dns"
        ttl                      = 60
        records                  = ["10.177.1.0"]
    }
    testhem6 = {
        name                    = "testhem6.az"
        zone_name               = "altairone.com"
        resource_group_name     = "dns"
        ttl                     = 60
        records                 = ["10.178.6.0"]
    }
}