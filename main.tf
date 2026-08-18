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
  vnet_name           = "hub-spoke-vnet"
  address_space       = ["10.0.0.0/16"]
}

module "security" {
  source              = "./modules/security"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vnet_id             = module.network.vnet_id
  tenant_id           = data.azurerm_client_config.current.tenant_id
}

module "compute" {
  source              = "./modules/compute"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  aks_subnet_id       = module.network.aks_subnet_id
  aks_pe_subnet_id    = module.network.aks_pe_subnet_id
  key_vault_id        = module.security.key_vault_id
  private_dns_zone_id = module.security.private_dns_zone_id
}

data "azurerm_client_config" "current" {}