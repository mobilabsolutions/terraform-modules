## Azure Key Vault Demo
Creates a Key Vault and a RSA key.

`azurerm/key_vault` and `azurerm/key_vault/key` modules will be used for this demo which will require configuration of `azurerm` provider. More information about modules and provider can be found on their respective pages. 

We have created a vars.tf file to interpolate variable values with help of a terraform.tfvars file. More information about required variables can be obtained from module documentation and provider page. You have to create it by yourself and provide all values it requires. You can use terraform.tfvars.example file as a starting point. Also an example of terraform.tfvars file can be seen below.

#### terraform.tfvars file
Due to private nature of this file, the decision to put it to VCS is up to the user.
```hcl
azure_subscription_id = "..."
azure_client_id       = "..."
azure_client_secret   = "..."
azure_tenant_id       = "..."
name                  = "testsqlserver"
location              = "West Europe"
administrator_login   = "..."
key_type              = "RSA"
key_opts              = ["wrapKey","unwrapKey"]
```

#### Output Reference
The following output variables will be outputted:

Name | Description | Type
----------------- | --------- | --------
key_vault_id  | The Key Vault ID. | string
key_vault_uri  | The URI of the vault for performing operations on keys and secrets. | string
key_id | The Key Vault Key ID | string
key_version | The current version of the Key Vault Key | string

### Instructions
* this folder (`{location_of_this_repo}/examples/key_vault/`) will be used as Terraform startpoint.
* rename `terraform.tfvars.example` to `terraform.tfvars` and enter desired values.
* run command `terraform init` to initialize terraform configuration.
* run command `terraform plan ` to see planned changes to be made on the infrastructure.
* run command `terraform apply` to apply the planned changes.
* run command `terraform plan` again to see that all changes all are applied and nothing needs to change.
* calculating some of the outputs can take some time. `terraform apply` command can be used to check if output values are calculated.
* if there is no need for change `terraform apply` command can be used to retrieve calculated output values.
* run command `terraform apply` to see calculated output values.
* run command `terraform destroy` to destroy the infrastructure if you don't want to get charged!
