## SQL Server
Create an Azure SQL Server.

### Example
```hcl
module "sql_server" {
  source                       = "github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/sql/server"
  name                         = "${var.sql_server_name}"
  resource_group_name          = "${var.resource_group_name}"
  location                     = "${var.location}"
  rule_list                    = "${var.sql_firewall_rules}"
  administrator_login          = "${var.administrator_login}"
  administrator_login_password = "${var.administrator_login_password}"
  tags                         = "${var.tags}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name |  (Required) The name of the SQL Server. | string 
resource_group_name | (Required) The name of the resource group in which to create the sql server. | string
location | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | string
version | (Required) The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server). | string
administrator_login | (Required) The administrator login name for the new server. | string
administrator_login_password | (Required) The password for the new AdministratorLogin. see [here](https://docs.microsoft.com/en-us/sql/relational-databases/security/password-policy) for more information about password complexity requirements. | string
rule_list | (Optional) Azure Sql Server Firewall rules. Passed in a as a list of comma deliniated string lists in a specific format. | list
tags | (Optional) A mapping of tags to assign to the resource. | map

Variables that must appear rule_list:

Name | Description | Order 
----------------- | --------- | -------- 
name | (Required) The name of the firewall rule. | 1
start_ip_address | (Required) The starting IP address to allow through the firewall for this rule. | 2
end_ip_address | (Required) The ending IP address to allow through the firewall for this rule. | 3 

An example configuration can be seen below:

```hcl
rule_list = ["all,0.0.0.0,255.255.255.255"]
```


Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id | The SQL Server ID. | string
name | The name of the sql server. | string
public_fqdn | The fully qualified domain name of the Azure SQL Server (e.g. myServerName.database.windows.net) | string
