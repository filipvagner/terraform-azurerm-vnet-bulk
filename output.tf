output "vnet_id" {
  description = "Virtual network ID"
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "Virtual network name"
  value       = azurerm_virtual_network.this.name
}

output "vnet_address_space" {
  description = "Virtual network address space"
  value       = azurerm_virtual_network.this.address_space
}

output "subnet_id" {
  description = "Subnet ID"
  value = flatten([for si in azurerm_subnet.this : si.id[*]])
}

output "subnet_name" {
  description = "Subnet name"
  value = flatten([for sn in azurerm_subnet.this : sn.name[*]])
}

output "subnet_range" {
  description = "Subnet range"
  value = flatten([for sr in azurerm_subnet.this : sr.address_prefixes[*]])
}