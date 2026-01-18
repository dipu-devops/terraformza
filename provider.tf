terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "resources"
    storage_account_name = "tfstate2024storage"
    container_name       = "tfstatecontainer"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "<subscription_id>"
  tenant_id       = "<tenant_id>"
  client_id       = "<client_id>"
  client_secret   = "<client_secret>"
}
