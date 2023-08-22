resource "azurerm_kubernetes_cluster" "aks_cluster" {
    name                = "sd5261-locvothanh-aks"
    location                = azurerm_resource_group.resource_group.location
    resource_group_name     = azurerm_resource_group.resource_group.name
    dns_prefix          = "myakscluster"

    identity {
      type = "SystemAssigned"
    }
    
    default_node_pool {
        name       = "default"
        node_count = 1
        vm_size    = "Standard_B4ms"
    }

    tags = {
        environment = "dev"
    }
}