resource "azurerm_kubernetes_cluster" "main" {
  location                          = data.azurerm_resource_group.rg.location
  name                              = "aks-cluster-01"
  resource_group_name               = data.azurerm_resource_group.rg.name
  node_resource_group               = "aks-resources"
  dns_prefix                        = "kubernetes"
  #tags                              = local.tags
  kubernetes_version                = var.aks.version.control_plane
  role_based_access_control_enabled = true
  local_account_disabled            = false


  # default node pool is always of Mode "System"
  default_node_pool {
    name                 = "system"
    vm_size              = var.aks.default_node_pool.vm_size
    os_disk_type         = "Managed"
    type                 = "VirtualMachineScaleSets"
    auto_scaling_enabled = true
    min_count            = var.aks.default_node_pool.min_count
    max_count            = var.aks.default_node_pool.max_count
    orchestrator_version = var.aks.version.node_pool
    upgrade_settings {
      max_surge = "10%"
    }
  }

  # Azure AD authentication with Azure RBAC
  azure_active_directory_role_based_access_control {
    azure_rbac_enabled = true
    tenant_id          = data.azurerm_client_config.current.tenant_id
  }




  identity {
    type = "SystemAssigned"
  }

  # oms_agent {
  #   log_analytics_workspace_id      = azurerm_log_analytics_workspace.monitoring.id
  #   msi_auth_for_monitoring_enabled = true
  # }

  # key_vault_secrets_provider {
  #   secret_rotation_enabled  = true
  #   secret_rotation_interval = "30m"
  # }

  # image_cleaner_enabled = true
  # image_cleaner_interval_hours = 96
}

data "azurerm_client_config" "current" {}


resource "azurerm_role_assignment" "aks_cluster_admin_to_sp" {
  principal_id         = data.azurerm_client_config.current.object_id
  scope                = azurerm_kubernetes_cluster.main.id
  role_definition_name = "Azure Kubernetes Service RBAC Cluster Admin"
}