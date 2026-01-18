resource "azurerm_storage_account" "storageaccount" {
  name                     = var.storageaccount
  resource_group_name      = var.zahidrg
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}