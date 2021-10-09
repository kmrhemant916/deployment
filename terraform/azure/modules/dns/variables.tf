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
//   description = "The parameters of the DNS zones: zone_name, resource_group_name"
//   type = map(object({
//       zone_name           = string
//       resource_group_name = string
//   }))
// }

variable "private_dns_a_record_params" {
  description = "Placeholder for the parameters of the private DNS A record"
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
  type = map(object({
    name                = string
    zone_name           = string
    resource_group_name = string
    ttl                 = number
    records             = string
  }))
}