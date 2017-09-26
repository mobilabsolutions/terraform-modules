# Azure RM
These are modules we use to handle common tasks on Microsoft Azure. 

### Prerequisites
To be able to interact with Microsoft Azure resources, credentials are needed. Below steps will help obtaning these credentials.
  1. Install [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).
  2. Follow [these](https://www.terraform.io/docs/providers/azurerm/index.html#creating-credentials) instructions to create Azure credentials.

### Configure Provider
A provider block must be present in root folder. Below example shows required variables to configure Azure RM provider. 
```hcl
# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "..."
  client_id       = "..."
  client_secret   = "..."
  tenant_id       = "..."
}
```


#### Argument Reference
The following arguments are supported:

Name | Description
----------------- | ---------
subscription_id  | (Optional) The subscription ID to use. It can also be sourced from the ARM_SUBSCRIPTION_ID environment variable.
client_id | (Optional) The client ID to use. It can also be sourced from the ARM_CLIENT_ID environment variable.
client_secret | (Optional) The client secret to use. It can also be sourced from the ARM_CLIENT_SECRET environment variable.
tenant_id | (Optional) The tenant ID to use. It can also be sourced from the ARM_TENANT_ID environment variable.