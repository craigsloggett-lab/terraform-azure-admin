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
