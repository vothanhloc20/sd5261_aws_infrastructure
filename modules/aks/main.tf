resource "azurerm_kubernetes_cluster" "aks_cluster" {
    name                = "sd5261-locvothanh-aks"
    location            = "Southeast Asia"
    resource_group_name = "myAzureResourceGroup"
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