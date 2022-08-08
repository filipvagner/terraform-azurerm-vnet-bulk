resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  location            = var.vnet_location
  resource_group_name = var.vnet_rg
  address_space       = ["192.168.${var.subnet_octet}.0/24"]
  dns_servers         = var.vnet_dns
}

resource "azurerm_subnet" "this" {
  count = var.subnet_counter

  name                 = "${var.subnet_name}-${random_string.this[count.index].result}"
  resource_group_name  = azurerm_virtual_network.this.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["192.168.${var.subnet_octet}.${var.subnet_address_space[count.index]}"]
}

resource "random_string" "this" {
  count = var.subnet_counter

  length      = 4
  min_numeric = 4
  special     = false
  lower       = true
}