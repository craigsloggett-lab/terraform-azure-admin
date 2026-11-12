resource "azurerm_resource_group" "channel_bridge_teams_adapter_dev" {
  name     = "rg-channel-bridge-teams-adapter-dev"
  location = "eastus"

  tags = {
    owner   = data.azuread_user.craig_sloggett.mail_nickname
    purpose = "channel-bridge-teams-adapter-dev"
  }
}
