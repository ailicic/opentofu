terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}

provider "azurerm" {
  features{}

  subscription_id = var.subscription_id
  tenant_id       = "b2748d0a-856e-4184-bda8-831f9ffa8a48"
#   client_id       = "<service-principal-client-id>"
#   client_secret   = "<service-principal-secret>"
}


data "azurerm_resource_group" "rg" {
  name = "rg-Aleksandar-Ilicic"
}
