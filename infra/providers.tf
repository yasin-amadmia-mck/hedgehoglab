terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.azurerm_subscription_id
  tenant_id       = var.azurerm_tenant_id
  client_id       = var.azurerm_client_id
  client_secret   = var.azurerm_client_secret
}