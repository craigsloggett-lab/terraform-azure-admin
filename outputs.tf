output "entra_tenant_id" {
  description = "The ID of the Entra tenant the azuread provider is authenticated against."
  value       = data.azuread_client_config.current.tenant_id
}

output "entra_object_id" {
  description = "The object ID of the Entra principal the azuread provider is authenticated as."
  value       = data.azuread_client_config.current.object_id
}

output "subscription_id" {
  description = "The ID of the subscription the azurerm provider is configured for."
  value       = data.azurerm_subscription.current.subscription_id
}

output "subscription_display_name" {
  description = "The display name of the subscription the azurerm provider is configured for."
  value       = data.azurerm_subscription.current.display_name
}
