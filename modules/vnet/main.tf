resource "azurerm_virtual_network" "vnet" {
    name                = "sd5261devops-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "Southeast Asia"
    resource_group_name = "myAzureResourceGroup"

    tags = {
        environment = "dev"
    }
}