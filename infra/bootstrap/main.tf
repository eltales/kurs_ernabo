provider "azurerm" {
  features {}
}

# Odczytujemy dane o ISTNIEJĄCEJ grupie zasobów.
data "azurerm_resource_group" "tfstate" {
  name = var.tfstate_rg_name
}

# Odczytujemy dane o ISTNIEJĄCYM koncie storage.
data "azurerm_storage_account" "tfstate" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.tfstate.name
}

# Odczytujemy dane o ISTNIEJĄCYM kontenerze.
data "azurerm_storage_container" "tfstate" {
  name                 = var.container_name
  storage_account_name = data.azurerm_storage_account.tfstate.name
}