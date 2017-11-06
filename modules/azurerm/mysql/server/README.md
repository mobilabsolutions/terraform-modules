## SQL Server
Create an Azure MySQL Server.

### Example
```hcl
module "mysql_server" {
  source                       = "github.com/mobilabsolutions/terraform-modules.git?ref=master//modules/azurerm/mysql/server"
  name                         = "${var.name}"
  resource_group_name          = "${var.resource_group_name}"
  location                     = "${var.location}"
  administrator_login          = "${var.administrator_login}"
  administrator_login_password = "${var.administrator_login_password}"
  ssl_enforcement              = "${var.ssl_enforcement}"
  storage_mb                   = "${var.storage_mb}"
  rule_list                    = "${var.sql_firewall_rules}"
  tags                         = "${var.tags}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name |  (Required) Specifies the name of the MySQL Server. Changing this forces a new resource to be created. | string 
resource_group_name | (Required) The name of the resource group in which to create the MySQL Server. | string
location | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | string
sku_name | (Required) Specifies the SKU Name for this MySQL Server. Possible values are: MYSQLB50, MYSQLB100, MYSQLS100, MYSQLS200, MYSQLS400 and MYSQLS800. | string
sku_capacity | (Required) Specifies the DTU's for this MySQL Server. Possible values are 50 and 100 DTU's when using a Basic SKU and 100, 200, 400 or 800 when using the Standard SKU. | string
sku_tier | (Required) Specifies the SKU Tier for this MySQL Server. Possible values are Basic and Standard. | string
version | (Required) Specifies the version of MySQL to use. Valid values are 5.6 and 5.7. Changing this forces a new resource to be created. | string
administrator_login | (Required) The Administrator Login for the MySQL Server. Changing this forces a new resource to be created. | string
administrator_login_password | (Required) The Password associated with the administrator_login for the MySQL Server. | string
ssl_enforcement | (Required) Specifies if SSL should be enforced on connections. Possible values are Enabled and Disabled. | string
rule_list | (Optional) Azure Sql Server Firewall rules. Passed in a as a list of comma delimited string lists in a specific format. | list
tags | (Optional) A mapping of tags to assign to the resource. | map

Variables that must appear in rule_list:

Name | Description | Order 
----------------- | --------- | -------- 
name | (Required) The name of the firewall rule. | 1
start_ip_address | (Required) The starting IP address to allow through the firewall for this rule. | 2
end_ip_address | (Required) The ending IP address to allow through the firewall for this rule. | 3 

An example configuration can be seen below:

```hcl
rule_list = ["all,0.0.0.0,255.255.255.255"]
```


Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) do not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id | The MySQL Server ID. | string
name | The name of the sql server. | string
public_fqdn | The fully qualified domain name of the Azure MySQL Server (e.g. myServerName.mysql.database.azure.com) | string
