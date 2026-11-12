resource "azurerm_resource_group" "channel_bridge_teams_adapter_dev" {
  name     = "rg-channel-bridge-teams-adapter-dev"
  location = "eastus"

  tags = {
    app   = "channel-bridge-teams-adapter"
    env   = "dev"
    owner = data.azuread_user.craig_sloggett.mail_nickname
  }
}
