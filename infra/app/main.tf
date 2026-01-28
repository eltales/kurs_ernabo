provider "azurerm" {
  features {}
}

# Losowy suffix, aby nazwy były unikalne globalnie
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_resource_group" "app" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_service_plan" "app" {
  name                = "${var.app_name}-plan"
  resource_group_name = azurerm_resource_group.app.name
  location            = azurerm_resource_group.app.location
  os_type             = "Linux"
  sku_name            = var.plan_sku_name
  tags                = var.tags
}

resource "azurerm_linux_web_app" "app" {
  name                = "${var.app_name}-${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.app.name
  location            = azurerm_service_plan.app.location
  service_plan_id     = azurerm_service_plan.app.id

  site_config {
    linux_fx_version = "DOCKER|${var.docker_image}:${var.docker_tag}"
    always_on        = true
  }

  app_settings = {
    "WEBSITES_PORT"                   = var.container_port
  }

  tags = var.tags
}