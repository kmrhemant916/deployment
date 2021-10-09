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

module "storage" {
    source                   = "../../modules/storage"
    storage_account_params   = var.storage_account_params
    storage_container_params = var.storage_container_params
}

module "cdn" {
    source                 = "../../modules/cdn"
    cdn_profile_params     = var.cdn_profile_params
    cdn_endpoint_params    = var.cdn_endpoint_params
}

module "dns" {
    source                          = "../../modules/dns"
    dns_cname_record_params         = var.dns_cname_record_params
    dns_a_record_params             = var.dns_a_record_params
    private_dns_a_record_params     = var.private_dns_a_record_params
    private_dns_cname_record_params = var.private_dns_cname_record_params
}