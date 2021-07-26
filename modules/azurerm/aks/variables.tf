variable "name_prefix" {
  type        = string
  description = "The name prefix for the resource."
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name."
}

variable "log_analytics_enabled" {
  type        = bool
  description = "Whether Log Analytics should be configured for the cluster or not."
  default     = false
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "The log analytics workspace name."
}

variable "log_analytics_workspace_retention_in_days" {
  type        = number
  default     = 30
  description = "The workspace data retention in days. Possible values range between 30 and 730."
}

variable "log_analytics_workspace_sku" {
  type        = string
  default     = "PerGB2018"
  description = "Specifies the Sku of the Log Analytics Workspace."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet that the Kubernetes cluster will be connected to."
}

variable "ssh_public_key" {
  type        = string
  description = "SSH Public key location."
}

variable "kubernetes_version" {
  type        = string
  description = "Version of Kubernetes specified when creating the AKS managed cluster."
  default     = null
}

variable "node_count" {
  type        = number
  description = "Number of nodes (VMs) in the default node pool."
  default     = 1
}

variable "vm_size" {
  type        = string
  description = "The size of each VM in the default node pool."
  default     = "Default"
}

variable "max_pods" {
  type        = number
  description = "The maximum number of pods that can run on each agent."
  default     = 100
}

variable "os_disk_size_gb" {
  type        = number
  description = "The size of the OS Disk which should be used for each agent in the Node Pool."
  default     = 30
}

variable "node_pool_type" {
  type        = string
  description = "The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets."
  default     = "VirtualMachineScaleSets"
}

variable "service_principal_id" {
  type        = string
  description = "Service Account Client Id."
}

variable "service_principal_secret" {
  type        = string
  description = "Service Account Client Secret."
}

variable "rbac_azuread_managed" {
  type        = bool
  description = "Is the Azure Active Directory integration Managed, meaning that Azure will create/manage the Service Principal used for integration."
  default     = true
}

variable "admin_group_object_ids" {
  type        = list(string)
  description = "A list of Object IDs of Azure Active Directory Groups which should have Admin Role on the Cluster."
  default     = []
}

variable "client_app_id" {
  type        = string
  description = "Azure AD Service Account Client Id for Client Application."
}

variable "server_app_id" {
  type        = string
  description = "Azure AD Service Account Client Id for Server Application."
}

variable "server_app_secret" {
  type        = string
  description = "Azure AD Service Account Client Secret for Server Application."
}

variable "service_cidr" {
  type        = string
  description = "The Network Range used by the Kubernetes service."
}

variable "dns_service_ip" {
  type        = string
  description = "IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns)."
}

variable "docker_bridge_cidr" {
  type        = string
  description = "IP address (in CIDR notation) used as the Docker bridge IP address on nodes."
}

variable "tags" {
  type        = map(any)
  description = "The mapping of tags to assign to the resource."
}
