variable "name_prefix" {
  default     = "hedgehoglab"
  description = "Prefix of the resource name."
}

variable "location" {
  default     = "uksouth"
  description = "Location of the resource."
}

variable "vnetadd" {
  default     = ["10.0.0.0/16"]
  description = "VNet Address"
}

variable "db_subnetadd" {
  default     = ["10.0.2.0/24"]
  description = "DB Subnet Addresses"
}

variable "container_subnetadd" {
  default     = ["10.0.1.0/24"]
  description = "Container Subnet Addresses"
}

variable "postgres_version" {
  default     = 13
  description = "Version of Postgres"
}

variable "postgres_storage_mb" {
  default     = 32768
  description = "Size of Postgres DB"
}

variable "postgres_sku" {
  default     = "GP_Standard_D2s_v3"
  description = "Postgres SKU"
}

variable "postgres_backup_retention_days" {
  default     = 7
  description = "Postgres Backup Retention Days"
}

variable "frontend_tag" {
  default     = "latest"
  description = "Frontend container tag to deploy"
}

variable "backend_tag" {
  default     = "latest"
  description = "Backend container tag to deploy"
}

variable "azurerm_subscription_id" {
  description = "Azure Credentials for Terraform"
}

variable "azurerm_tenant_id" {
  description = "Azure Credentials for Terraform"
}

variable "azurerm_client_id" {
  description = "Azure Credentials for Terraform"
}

variable "azurerm_client_secret" {
  description = "Azure Credentials for Terraform"
}