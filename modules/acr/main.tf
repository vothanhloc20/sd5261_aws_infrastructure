resource "azurerm_container_registry" "acr" {
    name                    = "devmycontainerregistry"
    location                = azurerm_resource_group.resource_group.location
    resource_group_name     = azurerm_resource_group.resource_group.name
    sku                     = "Standard"
    admin_enabled           = false

    tags = {
        environment = "dev"
    }
}