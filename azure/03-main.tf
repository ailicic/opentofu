terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}

provider "azurerm" {
  features {}

  # subscription_id = var.subscription_id
  # tenant_id       = var.tenant_id
  #   client_id       = "<service-principal-client-id>"
  #   client_secret   = "<service-principal-secret>"
}


data "azurerm_resource_group" "rg" {
  name = "rg-Aleksandar-Ilicic"
}
