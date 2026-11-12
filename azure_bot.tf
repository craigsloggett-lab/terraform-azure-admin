resource "azurerm_bot_service_azure_bot" "channel_bridge_teams_adapter_dev" {
  name                = "channel-bridge-teams-adapter-dev"
  resource_group_name = azurerm_resource_group.channel_bridge_teams_adapter_dev.name
  location            = "global"
  sku                 = "F0"

  microsoft_app_id        = azuread_application.channel_bridge_teams_adapter.client_id
  microsoft_app_type      = "SingleTenant"
  microsoft_app_tenant_id = data.azuread_client_config.current.tenant_id

  tags = azurerm_resource_group.channel_bridge_teams_adapter_dev.tags
}
