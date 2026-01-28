provider "azurerm" {
  features {}
}

# Krok 1: Używamy "data" zamiast "resource", aby odwołać się do ISTNIEJĄCEJ grupy zasobów.
# To rozwiązuje błąd "already exists". Terraform nie będzie już próbował jej tworzyć.
data "azurerm_resource_group" "tfstate" {
  name = var.tfstate_rg_name
}

# Krok 2: Zasób Storage Account pozostaje jako "resource", ponieważ chcemy nim zarządzać.
# Odwołuje się on do nazwy i lokalizacji z pobranych danych o grupie zasobów.
resource "azurerm_storage_account" "tfstate" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.tfstate.name
  location                 = data.azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public = false
  min_tls_version                 = "TLS1_2"

  tags = var.tags
}

# Krok 3: Kontener również pozostaje jako "resource" i zawiera poprawkę na deprecated argument.
resource "azurerm_storage_container" "tfstate" {
  name                  = var.container_name
  # Poprawka: Używamy "storage_account_id" zamiast przestarzałego "storage_account_name".
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}
