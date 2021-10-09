terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "=2.70.0"
        }
    }
}

provider "azurerm" {
    features {}
}

terraform {
    backend "azurerm" {}
}

module "base" {
    source                 = "../../modules/base"
    resource_group_params  = var.resource_group_params
}

module "network" {
    source                 = "../../modules/network"
    depends_on             = [module.base]
    virtual_network_params = var.virtual_network_params
    subnet_params          = var.subnet_params
    // resource_group_names   = module.base.resource_groups
}

module "storage" {
    source                 = "../../modules/storage"
    depends_on             = [module.base]
    storage_account_params = var.storage_account_params
}

module "cdn" {
    source                 = "../../modules/cdn"
    depends_on             = [module.base]
    cdn_profile_params     = var.cdn_profile_params
    cdn_endpoint_params    = var.cdn_endpoint_params
}

module "dns" {
    source                      = "../../modules/dns"
    dns_cname_record_params     = var.dns_cname_record_params
    dns_a_record_params         = var.dns_a_record_params
}