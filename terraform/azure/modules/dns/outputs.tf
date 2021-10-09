output "cname_records" {
    value = {
        for r in azurerm_dns_cname_record.this:
        r.name => tomap({
                    "id" = r.id
                    "name" = r.fqdn})
    }
}

output "a_records" {
    value = {
        for r in azurerm_dns_a_record.this:
        r.name => tomap({
                    "id" = r.id
                    "name" = r.fqdn})
    }
}

output "private_cname_records" {
    value = {
        for r in azurerm_private_dns_a_record.this:
        r.name => tomap({
                    "id" = r.id
                    "name" = r.fqdn})
    }
}

output "private_a_records" {
    value = {
        for r in azurerm_private_dns_cname_record.this:
        r.name => tomap({
                    "id" = r.id
                    "name" = r.fqdn})
    }
}