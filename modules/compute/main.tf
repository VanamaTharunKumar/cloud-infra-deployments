resource "azurerm_log_analytics_workspace" "main" {
  name                = "aks-log-analytics"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_log_analytics_solution" "main" {
  solution_name         = "ContainerInsights"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.main.id
  workspace_name        = azurerm_log_analytics_workspace.main.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                    = "aks-cluster"
  location                = var.location
  resource_group_name     = var.resource_group_name
  dns_prefix              = "aks-cluster"
  private_cluster_enabled = true

  default_node_pool {
    name           = "default"
    node_count     = 1
    vm_size        = "Standard_DS2_v2"
    vnet_subnet_id = var.aks_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }
}

resource "azurerm_private_endpoint" "kv_pe" {
  name                = "kv-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.aks_pe_subnet_id

  private_service_connection {
    name                           = "kv-privateserviceconnection"
    private_connection_resource_id = var.key_vault_id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "kv-dns-zone-group"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }
}