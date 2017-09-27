## Azure Storage Account Demo
Creates an Azure Storage account.

`azurerm/resource_group` and `azurerm/storage_account` modules will be used for this demo which will require configuration of `azurerm` provider. More information about modules and provider can be found on their respective pages. 

We have created a vars.tf file to interpolate variable values with help of a terraform.tfvars file. More information about required variables can be obtained from module documentation and provider page. You have to create it by yourself and provide all values it requires. You can use terraform.tfvars.example file as a starting point. Also an example of terraform.tfvars file can be seen below.

#### terraform.tfvars file
Due to private nature of this file, the decision to put it to VCS is up to the user.
```hcl
azure_subscription_id = "..."
azure_client_id       = "..."
azure_client_secret   = "..."
azure_tenant_id       = "..."
name = "testrancherstorage"
location = "West Europe"
```

#### Output Reference
The following output variables will be outputted:

Name | Description | Type
----------------- | --------- | --------
name  | Storage account name | string
primary_access_key  | Storage account primary access key | string


### Instructions
* this folder (`{location_of_this_repo}/examples/azure_storage_account/`) will be used as Terraform startpoint.
* create `terraform.tfvars` and enter value for required variables.
* run command `terraform init` to initialize terraform configuration.
* run command `terraform plan ` to see planned changes to be made on the infrastructure.
* run command `terraform apply` to apply the planned changes.
* run command `terraform plan` again to see that all changes all are applied and nothing needs to change.
* calculating some of the outputs can take some time. `terraform apply` command can be used to check if output values are calculated.
* if there is no need for change `terraform apply` command can be used to retrieve calculated output values.
* run command `terraform apply` to see calculated output values.
* for the sake of our demo we will show how to destroy the resource we created.
* run command `terraform destroy` to destroy the infrastructure.


### Screenshots
__Getting module data:__

![terraform get](https://user-images.githubusercontent.com/29708769/28307232-8102d37a-6ba2-11e7-9818-a81e0b1a4931.png)

__Checking planned changes:__

![terraform plan](https://user-images.githubusercontent.com/29708769/28307301-c4a4a1c6-6ba2-11e7-90ff-842386d7e8ef.png)

__Applying planned changes:__

![terraform apply](https://user-images.githubusercontent.com/29708769/28307331-d8775bb2-6ba2-11e7-995b-ad9d9c05f7c5.png)

__Checking to see if any changes are required:__

![terraform plan](https://user-images.githubusercontent.com/29708769/28307382-02d7b168-6ba3-11e7-8f8b-ca0219cffa2b.png)

__Checking if all output values are calculeted:__

![terraform apply](https://user-images.githubusercontent.com/29708769/28307422-219709c8-6ba3-11e7-88d0-3c33facc5bd4.png)

__Destroying the infrastructure:__

![terraform destroy](https://user-images.githubusercontent.com/29708769/28307471-50113292-6ba3-11e7-827b-7cb798940b97.png)


