provider "azuread" {
  tenant_id = "49e60d84-9139-4410-9c98-72fa0ba3f4e4"
}

provider "azurerm" {
  features {}
  subscription_id = "11eae39a-f22c-491a-bf5c-f03b9e4458c7"
  tenant_id       = "49e60d84-9139-4410-9c98-72fa0ba3f4e4"
}
