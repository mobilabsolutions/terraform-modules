## SQL Database
Create an Azure SQL Database.

Azure SQL Database is a relational database-as-a service using the Microsoft SQL Server Engine. SQL Database is a high-performance, reliable, and secure database you can use to build data-driven applications and websites in the programming language of your choice, without needing to manage infrastructure.

### Example
```hcl
module "sql_database" {
  source                           = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=master//modules/azurerm/sql/database"
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
create_mode | (Optional) Specifies the type of database to create. Defaults to Default. Valid values are: Default, Copy, Restore, Recovery, PointInTimeRestore, OnlineSecondary, NonReadableSecondary | string
source_database_id | (Optional) The URI of the source database if create_mode value is not Default. | string
restore_point_in_time | (Optional) The point in time for the restore. Only applies if create_mode is PointInTimeRestore e.g. 2013-11-08T22:00:40Z | string
edition | (Optional) The edition of the database to be created. Applies only if create_mode is Default. Valid values are: Basic, Standard, Premium, or DataWarehouse. | string
collation | (Optional) The name of the collation. Applies only if create_mode is Default. Azure default is SQL_LATIN1_GENERAL_CP1_CI_AS. | string
max_size_bytes | (Optional) The maximum size that the database can grow to. Applies only if create_mode is Default. | string
requested_service_objective_name | (Optional) Use requested_service_objective_name to set the performance level for the database. Valid values are: Basic, S0, S1, S2, S3, P1, P2, P4, P6, P11, P15 and ElasticPool. | string
source_database_deletion_date | (Optional) The deletion date time of the source database. Only applies to deleted databases where create_mode is Restore. | string
elastic_pool_name | (Optional) The name of the elastic database pool. | string
tags | (Optional) A mapping of tags to assign to the resource. | map

You can find explanation of `create_mode` values in detail below:

Name | Description  
----------------- | --------- 
Default | Regular database creation.
Copy | Creates a database as a copy of an existing database. `source_database_id` must be specified as the resource ID of the source database.
Restore | Creates a database by restoring a backup of a deleted database. `source_database_id` and `source_database_deletion_date` must be specified. 
Recovery | Creates a database by restoring a geo-replicated backup. `source_database_id` must be specified as the recoverable database resource ID to restore.
PointInTimeRestore | Creates a database by restoring a point in time backup of an existing database. `source_database_id` must be specified as the resource ID of the existing database, and `restore_point_in_time` must be specified.
OnlineSecondary | Creates a database as a readable secondary replica of an existing database. `source_database_id` must be specified as the resource ID of the existing primary database.
NonReadableSecondary | Creates a database as a nonreadable secondary replica of an existing database. `source_database_id` must be specified as the resource ID of the existing primary database.

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.

#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id | The SQL Database ID. | string
creation_date | The creation date of the SQL Database. | string
