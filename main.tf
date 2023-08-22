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
    skip_provider_registration = "true"
    features {}
}

module "resource_group" {
    source = "./modules/resource_group"
    resource_group_name     = var.resource_group_name
    resource_group_location = var.resource_group_location
}

module "vnet" {
    source = "./modules/vnet"
    resource_group_name     = module.resource_group.resource_group_name
    resource_group_location = module.resource_group.resource_group_location
}

module "acr" {
    source = "./modules/acr"
    resource_group_name     = module.resource_group.resource_group_name
    resource_group_location = module.resource_group.resource_group_location
}

module "aks_cluster" {
    source = "./modules/aks"
    resource_group_name     = module.resource_group.resource_group_name
    resource_group_location = module.resource_group.resource_group_location
}