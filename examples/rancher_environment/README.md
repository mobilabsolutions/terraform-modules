## Create Rancher Environment
Create a Rancher Environment, a Rancher Registy and a Rancher Registry Credential resource.

`rancher/environment` module will be used for this demo which will require configuration of `rancher` provider. More information about module and provider can be found on their respective pages. 

We have created a vars.tf file to interpolate variable values with help of a terraform.tfvars file. More information about required variables can be obtained from module documentation and provider page. You have to create it by yourself and provide all values it requires. You can use terraform.tfvars.example file as a starting point. Also an example of terraform.tfvars file can be seen below.

#### terraform.tfvars file
Due to private nature of this file, the decision to put it to VCS is up to the user.
```hcl
name = "testenvironment"
rancher_api_url = "https://rancher.example.com"
rancher_access_key = "..."
rancher_secret_key = "..."
registry_address = "..."
registry_email = "..."
registry_credential_public = "..."
registry_credential_private = "..."
```


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id  | Rancher environment id. | string


### Instructions
* this folder (`{location_of_this_repo}/examples/rancher_environment/`) will be used as Terraform startpoint.
* create `terraform.tfvars` and enter values for required variables.
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
__Applying planned changes:__

![terraform apply](https://user-images.githubusercontent.com/29708769/28366503-50df2c8e-6c8d-11e7-86a4-5eb802dd2563.png)

