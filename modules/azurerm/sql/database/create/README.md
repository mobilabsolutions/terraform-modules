## SQL Database
Create or update an Azure SQL Database.

Azure SQL Database is a relational database-as-a service using the Microsoft SQL Server Engine. SQL Database is a high-performance, reliable, and secure database you can use to build data-driven applications and websites in the programming language of your choice, without needing to manage infrastructure.

### Example
```hcl
module "sql_database" {
  source                           = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/sql/database"
  name                             = "${var.name}"
  resource_group_name              = "${var.resource_group_name}"
  location                         = "${var.location}"
  server_name                      = "${var.server_name}"
  edition                          = "Basic"
  requested_service_objective_name = "Basic"
  max_size_bytes                   = "2147483648"
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
edition | (Optional) The edition of the database to be created. Applies only if create_mode is Default. Valid values are: Basic, Standard, Premium, or DataWarehouse. | string
collation | (Optional) The name of the collation. Applies only if create_mode is Default. Azure default is SQL_LATIN1_GENERAL_CP1_CI_AS. | string
max_size_bytes | (Optional) The maximum size that the database can grow to. Applies only if create_mode is Default. | string
requested_service_objective_name | (Optional) Use requested_service_objective_name to set the performance level for the database. Valid values are: Basic, S0, S1, S2, S3, P1, P2, P4, P6, P11, P15 and ElasticPool. | string
elastic_pool_name | (Optional) The name of the elastic database pool. | string
tags | (Optional) A mapping of tags to assign to the resource. | map

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.

#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id | The SQL Database ID. | string
creation_date | The creation date of the SQL Database. | string
