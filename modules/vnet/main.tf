resource "azurerm_virtual_network" "vnet" {
    name                = "sd5261devops-vnet"
    address_space       = ["10.0.0.0/16"]
    location                = azurerm_resource_group.resource_group.location
    resource_group_name     = azurerm_resource_group.resource_group.name

    tags = {
        environment = "dev"
    }
}