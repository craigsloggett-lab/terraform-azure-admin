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
