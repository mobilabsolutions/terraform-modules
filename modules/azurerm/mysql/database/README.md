## SQL Database
Create or update a Azure Database for MySQL.

Azure Database for MySQL is a relational database service based on the open source MySQL Server engine. It is a fully managed database as a service offering capable of handling mission-critical workload with predictable performance and dynamic scalability. 

### Example
```hcl
module "mysql_database" {
  source              = "github.com/mobilabsolutions/terraform-modules.git?ref=master//modules/azurerm/mysql/database"
  name                = "${var.name}"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${var.mysql_server_name}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) Specifies the name of the Azure Database for MySQL, which needs to be a valid MySQL identifier. Changing this forces a new resource to be created. | string 
resource_group_name | (Required) The name of the resource group in which to create the sql database. | string
server_name | (Required) Specifies the name of the MySQL Server. Changing this forces a new resource to be created. | string
charset | (Required) Specifies the Charset for the MySQL Database, which needs to be a valid MySQL Charset. Changing this forces a new resource to be created. | string
collation | (Required) Specifies the Collation for the MySQL Database, which needs to be a valid MySQL Collation. Changing this forces a new resource to be created. | string

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) do not have default values. Check variables.tf file for more information.

#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id | The Azure Database for MySQL ID. | string
name | The name of the Azure Database for MySQL. | string
