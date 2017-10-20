## Azure Virtual Machine Cluster
Creates Azure Virtual Machine Cluster and connect all of the vm's to a Rancher Environment.

`rancher/environment`, `rancher/registration`, `azurerm/resource_group`, `azurerm/load_balancer/public`, `azurerm/network`, `azurerm/availability_set`, `azurerm/storage_account`, `azurerm/virtual_machine` and `rancher/host` modules will be used for this demo which will require configuration of `azurerm` and `rancher` providers. More information about modules and provider can be found on their respective pages. 

We have created a vars.tf file to interpolate variable values with help of a terraform.tfvars file. More information about required variables can be obtained from module documentation and provider page. You have to create it by yourself and provide all values it requires. You can use terraform.tfvars.example file as a starting point. Also an example of terraform.tfvars file can be seen below.

#### terraform.tfvars file
Due to private nature of this file, the decision to put it to VCS is up to the user.
```hcl
azure_subscription_id = "..."
azure_client_id       = "..."
azure_client_secret   = "..."
azure_tenant_id       = "..."
rancher_api_url = "..."
rancher_access_key = "..."
rancher_secret_key = "..."
name = "testranchercluster"
location = "West Europe"
address_space = "10.16.0.0/18"
subnets = { 
  "default" = "10.16.2.0/24"
}
network_security_rules = [
    "ssh,100,Inbound,Allow,Tcp,*,22,*,*", 
    "http,200,Inbound,Allow,Tcp,*,80,*,*",
    "https,300,Inbound,Allow,Tcp,*,443,*,*",
    "rancher-500,400,Inbound,Allow,Udp,*,500,*,*",
    "rancher-4500,410,Inbound,Allow,Udp,*,4500,*,*"
  ]
load_balancing_rules = [
    "main-http,Tcp,80,80,", 
    "main-https,Tcp,443,443,"
  ]
count = "2"
public_key_path = "..."
subnet_name = "default"
cloud_init_file = "rancherhost.conf"
ssh_users_file = "sshusers"
admin_username = "..."
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
vm_public_ips | List of Virtual machine public ips | list
vm_public_dns | List of Virtual machine public dns | list
vm_private_ips | List of Virtual machine private ip | list
vm_private_dns | List of Virtual machine private dns | list
lb_public_ip  | Load Balancer public ip | string
lb_public_dns  | Load Balancer public dns | string
lb_private_ip  | Load Balancer private ip | string


### Instructions
* this folder (`{location_of_this_repo}/examples/vm_cluster/`) will be used as Terraform startpoint.
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

![terraform apply](https://user-images.githubusercontent.com/29708769/28367049-84baf31a-6c8f-11e7-89f5-8f842e78f367.png)


__Checking if all output values are calculeted:__

![terraform apply](https://user-images.githubusercontent.com/29708769/28367055-8828e99e-6c8f-11e7-8362-4012877dd098.png)
