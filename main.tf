terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  aks_subnet_prefix   = var.aks_subnet_prefix
  pe_subnet_prefix    = var.pe_subnet_prefix
}

module "monitoring" {
  source              = "./modules/monitoring"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  workspace_name      = var.workspace_name
}

module "security" {
  source              = "./modules/security"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  key_vault_name      = var.key_vault_name
  vnet_id             = module.network.vnet_id
  pe_subnet_id        = module.network.pe_subnet_id
}

module "compute" {
  source                     = "./modules/compute"
  resource_group_name        = azurerm_resource_group.main.name
  location                   = azurerm_resource_group.main.location
  cluster_name               = var.cluster_name
  dns_prefix                 = var.dns_prefix
  kubernetes_version         = var.kubernetes_version
  aks_subnet_id              = module.network.aks_subnet_id
  log_analytics_workspace_id = module.monitoring.workspace_id
}