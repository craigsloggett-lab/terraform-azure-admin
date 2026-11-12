terraform {
  # Version v1.7.0 is the first version to introduce the `terraform test` command.
  required_version = "~> 1.7"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.10.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.13.0"
    }
  }
}
