resource "azurerm_kubernetes_cluster" "aks_cluster" {
    name                = "sd5261-locvothanh-aks"
    location            = var.resource_group_location
    resource_group_name = var.resource_group_name
    dns_prefix          = "myakscluster"

    identity {
      type = "SystemAssigned"
    }
    
    default_node_pool {
        name       = "default"
        node_count = 1
        vm_size    = "Standard_B4ms"
    }

    network_profile {
        network_plugin        = "kubenet"
        load_balancer_profile = "standard"
    }

    tags = {
        environment = "dev"
    }
}