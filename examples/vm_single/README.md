## Azure Single Virtual Machine with Rancher Server
Creates an Azure Virtual Machine and installs Rancher Server on it. Rancher Server uses an Azure Storage Account to store data.

`azurerm/resource_group`, `azurerm/network`, `azurerm/storage_account` and `azurerm/virtual_machine` modules will be used for this demo which will require configuration of `azurerm` provider. More information about modules and provider can be found on their respective pages. 

We have created a vars.tf file to interpolate variable values with help of a terraform.tfvars file. More information about required variables can be obtained from module documentation and provider page. You have to create it by yourself and provide all values it requires. You can use terraform.tfvars.example file as a starting point. Also an example of terraform.tfvars file can be seen below.

#### terraform.tfvars file
Due to private nature of this file, the decision to put it to VCS is up to the user.
```hcl
azure_subscription_id = "..."
azure_client_id       = "..."
azure_client_secret   = "..."
azure_tenant_id       = "..."
name = "testrancherserver"
location = "West Europe"
address_space = "10.16.0.0/18"
subnets = { 
  "default" = "10.16.2.0/24"
}
network_security_rules = [
    "ssh,100,Inbound,Allow,Tcp,*,22,*,*", 
    "http,200,Inbound,Allow,Tcp,*,80,*,*",
    "https,300,Inbound,Allow,Tcp,*,443,*,*"
  ]
public_key_path = "..."
subnet_name = "default"
cloud_init_file = "rancherserver.conf"
ssh_users_file = "sshusers"
```


If you want more than one person to reach the vm. You need to use ssh_users_file variable which should point to a file. There is a special format for this file. You can see an example below. The spaces and the dash before the ssh keys are mandatory. 

```
  - ssh-rsa AAAAB3NzaC1yc2EAAa....
  - ssh-rsa AAAAB3NzaC1yc2EAAA...
  - ssh-rsa AAAAB3NzaC1yc2EAAA...
```

#### Output Reference
The following output variables will be outputted:

Name | Description | Type
----------------- | --------- | --------
vm_public_ip | Virtual machine public ip. | string
vm_public_dns | Virtual machine public dns. | string
vm_private_ip | Virtual machine private ip. | string
vm_private_dns | Virtual machine private dns. | string


### Instructions
* this folder (`{location_of_this_repo}/examples/vm_single/`) will be used as Terraform startpoint.
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
__Applying planned changes:__

![terraform apply](https://user-images.githubusercontent.com/29708769/28361075-cbb68206-6c77-11e7-8b1c-43c8bf542bd1.png)


__Checking if all output values are calculeted:__

![terraform apply](https://user-images.githubusercontent.com/29708769/28361089-dc62e6f8-6c77-11e7-9f4b-e32b0f8d651c.png)



