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