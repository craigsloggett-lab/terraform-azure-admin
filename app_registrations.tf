resource "azuread_application" "channel_bridge_teams_adapter_dev" {
  display_name     = "channel-bridge-teams-adapter-dev"
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
