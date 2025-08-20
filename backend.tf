terraform {
	backend "azurerm" {
        subscription_id = var.subscription_id
		resource_group_name = "rg-Aleksandar-Ilicic"
		storage_account_name = "rgailicictfstate"
		container_name = "tfstate"
		key = "key.tfstate"
	}
}