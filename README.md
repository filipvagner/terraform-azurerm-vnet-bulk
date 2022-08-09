# terraform-azurerm-vnet-bulk
 Terraform module to create Azure vnet in bulk. This _Terraform_ configuration deploys vnet with address space ```192.168.x.0/24```.
 Number of subnet deployed within vnet is specified by property ```subnet_counter``` and deploys subnets of size ```/27```.
 
 Property ```vnet_dns```, it is optional, in case it is omitted, default _Azure-provided_ is used, otherwise use array of _DNS_ servers.  
 Property ```subnet_name``` insert name of subnet, which will get appended four random numbers (i.e.: ```subnet-3658```).
 Property ```subnet_octect```, in case deploying more than one vnet, use count index as in example.
 
 ## Deploying more than one virtual network
 To deploy more than one virtual network, use ```count``` meta-argument.
 
 **Example:**
 ```
 resource "azurerm_resource_group" "this" {
  name     = "rg-vnets"
  location = "West Europe"
}

 module "vnet_bulk" {
  source = "git::https://github.com/filipvagner/terraform-azurerm-vnet-bulk.git?ref=1.0.0"

  count = var.vnet_counter

  vnet_name      = "vnet-${count.index}"
  vnet_rg        = azurerm_resource_group.this.name
  vnet_location  = azurerm_resource_group.this.location
  vnet_dns       = ["8.8.8.8"]
  subnet_name    = "subnet"
  subnet_octet   = "${count.index}"
  subnet_counter = 2
}
```

 ## Deploying one virtual network
 To deploy one virtual network (ommit ```count``` meta-argument) use code example below.
 
 **Example:**
 ```
  resource "azurerm_resource_group" "this" {
  name     = "rg-vnet"
  location = "West Europe"
}

 module "vnet_single" {
  source = source = "git::https://github.com/filipvagner/terraform-azurerm-vnet-bulk.git?ref=1.0.0"

  vnet_name      = "vnet-single"
  vnet_rg        = azurerm_resource_group.this.name
  vnet_location  = azurerm_resource_group.this.location
  subnet_name    = "subnet"
  subnet_octet   = "10"
  subnet_counter = 1
}
```
