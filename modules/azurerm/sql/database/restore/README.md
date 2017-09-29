## SQL Database
Restores an Azure SQL Database to a point in time.

Azure SQL Database is a relational database-as-a service using the Microsoft SQL Server Engine. SQL Database is a high-performance, reliable, and secure database you can use to build data-driven applications and websites in the programming language of your choice, without needing to manage infrastructure.

### Example
```hcl
module "sql_database" {
  source                           = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/sql/database"
  name                             = "${var.name}"
  resource_group_name              = "${var.resource_group_name}"
  location                         = "${var.location}"
  server_name                      = "${var.server_name}"
  tags                             = "${var.tags}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) The name of the SQL Database. | string 
resource_group_name | (Required) The name of the resource group in which to create the sql database. | string
location | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | string
server_name | (Required) The name of the SQL Server on which to create the database. | string
source_database_id | (Required) The URI of the source database. | string
restore_point_in_time | (Required) The point in time for the restore e.g. 2013-11-08T22:00:40Z | string
tags | (Optional) A mapping of tags to assign to the resource. | map

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.

#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id | The SQL Database ID. | string
creation_date | The creation date of the SQL Database. | string
