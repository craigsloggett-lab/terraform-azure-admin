locals {
  channel_bridge_teams_adapter_graph_delegated_scopes = toset([
    "User.Read",
  ])

  channel_bridge_teams_adapter_graph_application_roles = toset([
    "Chat.Read.All",
    "Chat.ReadBasic.All",
    "User.Read.All",
  ])
}

data "azuread_user" "craig_sloggett" {
  mail_nickname = "craig.sloggett"
}

data "azuread_application_published_app_ids" "well_known" {}

data "azuread_service_principal" "msgraph" {
  client_id = data.azuread_application_published_app_ids.well_known.result["MicrosoftGraph"]
}

resource "azuread_application" "channel_bridge_teams_adapter" {
  display_name     = "sp-channel-bridge-teams-adapter"
  sign_in_audience = "AzureADMyOrg"
  owners           = [data.azuread_user.craig_sloggett.object_id]

  required_resource_access {
    resource_app_id = data.azuread_application_published_app_ids.well_known.result["MicrosoftGraph"]

    dynamic "resource_access" {
      for_each = local.channel_bridge_teams_adapter_graph_delegated_scopes

      content {
        id   = data.azuread_service_principal.msgraph.oauth2_permission_scope_ids[resource_access.value]
        type = "Scope"
      }
    }

    dynamic "resource_access" {
      for_each = local.channel_bridge_teams_adapter_graph_application_roles

      content {
        id   = data.azuread_service_principal.msgraph.app_role_ids[resource_access.value]
        type = "Role"
      }
    }
  }
}

resource "azuread_service_principal" "channel_bridge_teams_adapter" {
  client_id = azuread_application.channel_bridge_teams_adapter.client_id
  owners    = [data.azuread_user.craig_sloggett.object_id]

  feature_tags {
    enterprise = true
    hide       = true
  }
}

resource "azuread_service_principal_delegated_permission_grant" "channel_bridge_teams_adapter_msgraph" {
  service_principal_object_id          = azuread_service_principal.channel_bridge_teams_adapter.object_id
  resource_service_principal_object_id = data.azuread_service_principal.msgraph.object_id
  claim_values                         = local.channel_bridge_teams_adapter_graph_delegated_scopes
}

resource "azuread_app_role_assignment" "channel_bridge_teams_adapter_msgraph" {
  for_each = local.channel_bridge_teams_adapter_graph_application_roles

  principal_object_id = azuread_service_principal.channel_bridge_teams_adapter.object_id
  resource_object_id  = data.azuread_service_principal.msgraph.object_id
  app_role_id         = data.azuread_service_principal.msgraph.app_role_ids[each.value]
}
