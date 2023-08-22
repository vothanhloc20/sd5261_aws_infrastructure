resource "azurerm_container_registry" "acr" {
    name                    = "devmycontainerregistry"
    location                = var.resource_group_location
    resource_group_name     = var.resource_group_name
    sku                     = "Standard"
    admin_enabled           = false

    georeplication_locations = [var.resource_group_location]

    tags = {
        environment = "dev"
    }
}