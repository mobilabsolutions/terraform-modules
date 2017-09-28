## Terraform
Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers. More information can be found [here](https://www.terraform.io/intro/index.html).


### Prerequisites
  1. Install [Terraform](https://www.terraform.io/intro/getting-started/install.html).
  2. Get to know basic terraform commands (`init, get, plan, apply, destroy`) that we need with `terraform --help`. 
    * `terraform --help <command>`

### Resources
The most important thing you'll configure with Terraform are resources. Resources are basic building blocks of your infrastructure. It might be some low level component such as a public ip, virtual machine, or storage account. Or it can be a higher level component such as an email provider, DNS record, or database provider.

#### Example
A resource configuration looks like the following:
```hcl
resource "azurerm_resource_group" "rg" {
  name                 = "terraform-rg"
  location             = "West Europe"
}
```

The `resource` block creates a resource of given TYPE (first parameter) and NAME (second parameter). The combination of type and name must be unique.

Within the block( the {  } ) is configuration for the resource. The configuration is dependent on the type.


### Providers
Providers are responsible in Terraform for managing the lifecycle of a resource: create, read, update, delete.

Every resource in Terraform is mapped to a provider based on longest-prefix matching. For example the azurerm_resource_group resource type would map to the azurerm provider (if that exists).

Most providers require some sort of configuration to provide authentication information, endpoint URLs, etc. Provider configuration blocks are a way to set this information globally for all matching resources.

#### Example
A provider configuration looks like the following:
```hcl
provider "azurerm" {
  subscription_id = "foo"
  client_id       = "bar"
  client_secret   = "foobar"
  tenant_id       = "barfoo"
}
```


### Variables
Variables define the parameterization of Terraform configurations. A variable can be string, list or map. 

#### Example
A variable configuration looks like the following:
```hcl
variable azure_subscription_id {
  description = "Azure Subscription ID"
}

variable name { type = "string" }

variable subnets { 
  type = "map" 
  default = { 
    "subnet1" = "10.16.2.0/24"
  }
}

variable network_security_rules { 
  type = "list" 
  default = [
    "ssh,100,Inbound,Allow,Tcp,*,22,*,*", 
    "http,200,Inbound,Allow,Tcp,*,80,*,*",
    "https,300,Inbound,Allow,Tcp,*,443,*,*"
  ]
}

variable location {
  type = "string" 
  default = "West Europe"
}
```

The `variable ` block configures a single input variable for a Terraform configuration. 

The `name` given to the variable block is the name used to set variable value, with command line or variable file. Variable block can have `type`, `default` and `description` fields. Variables without default values needs to be supplied with a value. Variables with a type must be supplied with specified type. If variable value is supplied, it overrides default value.

Variables can be collected in files and passed all at once using the -var-file=foo.tfvars flag. If a file named terraform.tfvars is present in the current directory (Terraform entrypoint), Terraform automatically loads it to populate variables. If the file is named something else, you can pass the path to the file using the -var-file flag.

#### Example
A variable file looks like the following:
```hcl
azure_subscription_id = "foo"

name = "bar"

subnets = { 
  "default" = "10.16.2.0/24"
}
network_security_rules = [
    "ssh,100,Inbound,Allow,Tcp,*,22,*,*", 
    "http,200,Inbound,Allow,Tcp,*,80,*,*",
    "https,300,Inbound,Allow,Tcp,*,443,*,*"
  ]

location = "West US"
```


#### Example
Usage of variables looks like the following:
```hcl
resource "azurerm_virtual_network" "vn" {
  name                 = "${var.name}-vn"
  resource_group_name  = "${var.resource_group_name}"
  address_space        = ["${split(",",var.address_space)}"]
  location             = "${var.location}"

  tags {
    Name               = "${var.name}-vn"
    Project            = "${var.name}"
  }
}
```

Variables defined in a module (root or otherwise) can be reached with `var` keyword in the same module.  

### Interpolation
Embedded within strings in Terraform, whether you're using the Terraform syntax or JSON syntax, you can interpolate other values. These interpolations are wrapped in ${}, such as ${var.foo}.

The interpolation syntax is powerful and allows you to reference variables, attributes of resources, call functions, etc.

You can perform simple math in interpolations, allowing you to write expressions such as ${count.index + 1}. And you can also use conditionals to determine a value based on some logic.

You can escape interpolation with double dollar signs: $${foo} will be rendered as a literal ${foo}.

__User string variables__
Use the var. prefix followed by the variable name. For example, ${var.foo} will interpolate the foo variable value.

__User map variables__
The syntax is var.MAP["KEY"]. For example, ${var.amis["us-east-1"]} would get the value of the us-east-1 key within the amis map variable.

__User list variables__
The syntax is "${var.LIST}". For example, "${var.subnets}" would get the value of the subnets list, as a list. You can also return list elements by index: ${var.subnets[[idx]]}.

__Attributes of other resources__
The syntax is TYPE.NAME.ATTRIBUTE. For example, ${azurerm_resource_group.rg.id} will interpolate the ID attribute from the azurerm_resource_group resource named rg. If the resource has a count attribute set, you can access individual attributes with a zero-based index, such as ${azurerm_virtual_machine.vm.0.id}. You can also use the splat syntax to get a list of all the attributes: ${azurerm_virtual_machine.vm.*.id}.

__Attributes of a data source__
The syntax is data.TYPE.NAME.ATTRIBUTE. For example. ${data.aws_ami.ubuntu.id} will interpolate the id attribute from the aws_ami data source named ubuntu. If the data source has a count attribute set, you can access individual attributes with a zero-based index, such as ${data.aws_subnet.example.0.cidr_block}. You can also use the splat syntax to get a list of all the attributes: ${data.aws_subnet.example.*.cidr_block}.

__Outputs from a module__
The syntax is MODULE.NAME.OUTPUT. For example ${module.foo.bar} will interpolate the bar output from the foo module.

__Count information__
The syntax is count.FIELD. For example, ${count.index} will interpolate the current index in a multi-count resource. 

__Path information__
The syntax is path.TYPE. TYPE can be cwd, module, or root. cwd will interpolate the current working directory. module will interpolate the path to the current module. root will interpolate the path of the root module. In general, you probably want the path.module variable.


## Outputs
When building potentially complex infrastructure, Terraform stores hundreds or thousands of attribute values for all your resources. But as a user of Terraform, you may only be interested in a few values of importance, such as a load balancer IP, VPN address, etc.

Outputs are a way to tell Terraform what data is important. This data is outputted when apply is called, and can be queried using the terraform output command.

Outputs also can be used on modules where they act as return values. 

#### Example
A simple output configuration looks like the following:
```hcl
output "id" {
  value = "${azurerm_resource_group.rg.id}"
}
```

This will output a string value corresponding to the Resource Group name. It is possible to export complex data types like maps and lists as well.

```hcl
output "vm_ids" {
  value = "${azurerm_virtual_machine.vm.*.id}"
}
```

Module outputs can be used as output values.
```hcl
output vm_public_ip {
  value = "${module.single_vm.vm_public_ip}"
}
```
  
## Modules
Modules in Terraform are self-contained packages of Terraform configurations that are managed as a group. Modules are used to create reusable components in Terraform as well as for basic code organization. 

#### Example
A simple module configuration looks like the following:
```hcl
module "resource_group" {
  source = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=master//modules/azurerm/resource_group"
  name = "${var.name}"
  location = "${var.location}"
}
```

The `module` block tells Terraform to create and manage a module. It is very similar to resource block. It has a logical name and a set of configurations. 

The `source` configuration is the only mandatory key for modules. It tells Terraform where the module can be retrieved. Terraform automatically downloads and manages modules for you.

Even though Terraform gets the modules automatically with `init` command. For the updates, you'll have to get te modules by yourself which can be done using `get` command.

```sh
$ terraform get
# ...
```

This command will download the modules if they haven't been already. By default, the command will not check for updates, so it is safe (and fast) to run multiple times. You can use the -update flag to check and download updates.


### Root Module
Root module that is the current working directory when you run terraform commands, holding the Terraform configuration and state files. It is itself a valid module. By nature it does not require `source` configuration.
