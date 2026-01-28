terraform {
  required_version = ">= 1.6.0"

  # Backend "azurerm" będzie skonfigurowany parametrami w terraform init (backend-config)
  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}