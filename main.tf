terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.69.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "MyVMGroup" {
  name     = "myAzureResourceGroup"
  location = "Southeast Asia"
}

resource "azurerm_virtual_network" "sd5261devops-vnet" {
  name                = "myVMVirtualNetwork"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.MyVMGroup.location
  resource_group_name = azurerm_resource_group.MyVMGroup.name
}

resource "azurerm_container_registry" "sd5261AcrRegistry" {
  name                = "myVMContainerRegistry"
  location            = azurerm_resource_group.MyVMGroup.location
  resource_group_name = azurerm_resource_group.MyVMGroup.name
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "sd5261-locvothanh-aks" {
  name                = "myVMKubernetesCluster"
  location            = azurerm_resource_group.MyVMGroup.location
  resource_group_name = azurerm_resource_group.MyVMGroup.name
  dns_prefix          = "myvmdnsprefix"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2_v3"
  }

  service_principal {
    client_id     = var.id
    client_secret = var.password
  }

  tags = {
    environment = "dev"
  }
}