terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.67.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">=1.6.0"
    }
  }
}

data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

data "azuread_service_principal" "this" {
  application_id = var.service_principal_id
}

# Create Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "this" {
  count               = var.log_analytics_enabled ? 1 : 0
  name                = "${var.name_prefix}${var.log_analytics_workspace_name}"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_analytics_workspace_retention_in_days
  tags                = var.tags
}

# Create Log Analytics Solution
resource "azurerm_log_analytics_solution" "this" {
  count                 = var.log_analytics_enabled ? 1 : 0
  solution_name         = "ContainerInsights"
  resource_group_name   = data.azurerm_resource_group.this.name
  location              = data.azurerm_resource_group.this.location
  workspace_resource_id = azurerm_log_analytics_workspace.this[count.index].id
  workspace_name        = azurerm_log_analytics_workspace.this[count.index].name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

# Create Kubernetes Cluster
resource "azurerm_kubernetes_cluster" "this" {
  name                = "${var.name_prefix}${var.kubernetes_cluster_name}"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  kubernetes_version  = var.kubernetes_version
  dns_prefix          = data.azurerm_resource_group.this.name

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }
  lifecycle {
    ignore_changes=[linux_profile]
  }


  default_node_pool {
    name            = "defaulpool"
    vm_size         = var.vm_size
    max_pods        = var.max_pods
    os_disk_size_gb = var.os_disk_size_gb
    node_count      = var.node_count
    vnet_subnet_id  = var.subnet_id
    type            = var.node_pool_type
  }

  service_principal {
    client_id     = data.azuread_service_principal.this.application_id
    client_secret = var.service_principal_secret
  }

  role_based_access_control {
    enabled = true

    azure_active_directory {
      managed                = var.rbac_azuread_managed
      admin_group_object_ids = var.rbac_azuread_managed == true ? var.admin_group_object_ids : null
      azure_rbac_enabled     = var.rbac_azuread_managed == true ? true : null
      client_app_id          = var.rbac_azuread_managed == false ? var.client_app_id : null
      server_app_id          = var.rbac_azuread_managed == false ? var.server_app_id : null
      server_app_secret      = var.rbac_azuread_managed == false ? var.server_app_secret : null
      tenant_id              = data.azurerm_client_config.current.tenant_id
    }
  }

  network_profile {
    network_plugin     = "azure"
    service_cidr       = var.service_cidr
    dns_service_ip     = var.dns_service_ip
    docker_bridge_cidr = var.docker_bridge_cidr
  }

  addon_profile {
    oms_agent {
      enabled                    = var.log_analytics_enabled
      log_analytics_workspace_id = var.log_analytics_enabled ? azurerm_log_analytics_workspace.this[0].id : null
    }
  }

  tags = var.tags
}