resource "azurerm_bot_service_azure_bot" "channel_bridge_teams_adapter_dev" {
  name                = "bot-channel-bridge-teams-adapter-dev"
  resource_group_name = azurerm_resource_group.channel_bridge_teams_adapter_dev.name
  location            = "global"
  sku                 = "F0"
  endpoint            = var.channel_bridge_teams_adapter_dev_messaging_endpoint

  microsoft_app_id        = azuread_application.channel_bridge_teams_adapter_dev.client_id
  microsoft_app_type      = "SingleTenant"
  microsoft_app_tenant_id = data.azuread_client_config.current.tenant_id

  tags = azurerm_resource_group.channel_bridge_teams_adapter_dev.tags
}

resource "azurerm_bot_channel_ms_teams" "channel_bridge_teams_adapter_dev" {
  bot_name            = azurerm_bot_service_azure_bot.channel_bridge_teams_adapter_dev.name
  resource_group_name = azurerm_resource_group.channel_bridge_teams_adapter_dev.name
  location            = azurerm_bot_service_azure_bot.channel_bridge_teams_adapter_dev.location
}
