terraform {
  backend "azurerm" {
    subscription_id      = "5e981a2a-5bf4-4b92-bce8-ee75f591b8e4"
    resource_group_name  = "rg-Aleksandar-Ilicic"
    storage_account_name = "rgailicictfstate"
    container_name       = "tfstate"
    key                  = "key.tfstate"
  }
}