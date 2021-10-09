variable "resource_group_params" {
  description = "Placeholder for the parameters of the resource group"
  type = map(object({
    name             = string
    location         = string
    tags             = map(string)
  }))
}