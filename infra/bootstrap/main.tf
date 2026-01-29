provider "azurerm" {
  features {}

  subscription_id = var.subscription_id 
}


resource "azurerm_resource_group" "tfstate" {
  name     = var.tfstate_rg_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_storage_account" "tfstate" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "GRS" # Geo-Redundant Storage for resilience
  tags                     = var.tags
}

resource "azurerm_storage_container" "tfstate_container" {
  name                 = var.container_name
  storage_account_id   = azurerm_storage_account.tfstate.id  # używamy id zamiast name
  container_access_type = "private"
}
