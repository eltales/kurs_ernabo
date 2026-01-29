provider "azurerm" {
  features {}

  subscription-id = ${{ secrets.AZURE_SUBSCRIPTION_ID }}
}


data "azurerm_resource_group" "tfstate" {
  name = var.tfstate_rg_name
}

data "azurerm_storage_account" "tfstate" {  # Istniejący SA
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.tfstate.name
}

resource "azurerm_storage_container" "tfstate" {  # Nowy kontener
  name                  = var.container_name
  storage_account_name  = data.azurerm_storage_account.tfstate.name  # data!
  container_access_type = "private"
}
