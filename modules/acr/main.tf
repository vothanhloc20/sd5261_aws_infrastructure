resource "azurerm_container_registry" "acr" {
    name                    = "devmycontainerregistry"
    location                = "Southeast Asia"
    resource_group_name     = "myAzureResourceGroup"
    sku                     = "Standard"
    admin_enabled           = false

    tags = {
        environment = "dev"
    }
}