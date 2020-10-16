terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.20.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "=0.10.0"
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
  name                = "${var.name_prefix}-${var.log_analytics_ws_name}"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.retention_in_days
  tags                = var.tags
}

# Create Log Analytics Solution
resource "azurerm_log_analytics_solution" "this" {
  solution_name         = "ContainerInsights"
  resource_group_name   = data.azurerm_resource_group.this.name
  location              = data.azurerm_resource_group.this.location
  workspace_resource_id = azurerm_log_analytics_workspace.this.id
  workspace_name        = azurerm_log_analytics_workspace.this.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

# Create Kubernetes Cluster
resource "azurerm_kubernetes_cluster" "this" {
  name                = "${var.name_prefix}-aks"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  kubernetes_version  = var.kubernetes_version
  dns_prefix          = var.resource_group_name

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file("${var.ssh_public_key}")
    }
  }

  default_node_pool {
    name            = "defaulpool"
    vm_size         = var.vm_size
    max_pods        = 100
    os_disk_size_gb = 30
    node_count      = var.node_count
    vnet_subnet_id  = var.subnet_id
    type            = "VirtualMachineScaleSets"
  }

  service_principal {
    client_id     = data.azuread_service_principal.this.application_id
    client_secret = var.service_principal_secret
  }

  role_based_access_control {
    enabled = true

    azure_active_directory {
      client_app_id     = var.client_app_id
      server_app_id     = var.server_app_id
      server_app_secret = var.server_app_secret
      tenant_id         = data.azurerm_client_config.current.tenant_id
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
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id
    }
  }

  tags       = var.tags
}