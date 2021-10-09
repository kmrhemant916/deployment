# Terraform modules

## Pre-requisite

* Terraform version - **v1.0.4**
* Provider version
  * azurerm - **v2.70.0**

## How to deploy a topology for a given environment

### Step 1 - Get the backend config secrets

* **NOTE:**
  * This step is applicable to only for existing environment
  * If you are developing a new environment you don't need them
* Get backend config secrets for a given env from 1password
* An example of how to create a backend secrets

```tf
access_key              = "xxxxxx"
container_name          = "dev"
key                     = "a1-dev3-base.tfstate"
storage_account_name    = "xxxxxx"
subscription_id         = "xxxxxx"
tenant_id               = "xxxxxx"
```

### Step 2 - init/plan/apply

```bash
cd a1-terraform/topology/<topology_name>
terraform init --backend-config ../../secrets/dev3.tfvars
terraform plan -var-file ../../var/<target_env>/dev3.tfvars -out out.plan
terraform apply out.plan
terraform destroy -var-file ../var/<target_env>/dev3.tfvars
```

## Module Introduction

### base

* It will create multiple/single resource group in parallel, an example of the variable

```tf
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
```

### cdn

* It will create multiple/single CDN profile/endpoint in parallel, an example of the variable
* CDN profile parameters example

```tf
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
```

* CDN endpoint params example

```tf
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
```

### dns

* It will create multiple/single public/private DNS CNAME/A records
* An example of the variable

```tf
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
```

### network

* It will create multiple/single virtual network and subnet
* An example of the virtual_network_params variable

```tf
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
```

* An example of the subnet_params variable

```tf
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
```

### storage

* It will create multiple/single storage account on azure
* An example of the variable

```tf
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
```
