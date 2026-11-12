data "azurerm_policy_definition_built_in" "allowed_resource_types" {
  display_name = "Allowed resource types"
}

resource "azurerm_policy_definition" "deny_botservices_sku_not_f0" {
  name         = "deny-botservices-sku-not-f0"
  display_name = "deny-botservices-sku-not-f0"
  description  = "Azure Bot resources must be F0."
  policy_type  = "Custom"
  mode         = "Indexed"

  metadata = jsonencode({
    category = "Cost"
  })

  policy_rule = jsonencode({
    if = {
      allOf = [
        {
          field  = "type"
          equals = "Microsoft.BotService/botServices"
        },
        {
          field     = "Microsoft.BotService/botServices/sku.name"
          notEquals = "F0"
        },
      ]
    }
    then = {
      effect = "deny"
    }
  })
}

resource "azurerm_subscription_policy_assignment" "allowed_resource_types" {
  name                 = "allowed-resource-types"
  display_name         = "Allowed resource types"
  description          = "Personal credit card, only free-tier."
  subscription_id      = data.azurerm_subscription.current.id
  policy_definition_id = data.azurerm_policy_definition_built_in.allowed_resource_types.id

  parameters = jsonencode({
    listOfResourceTypesAllowed = {
      value = [
        "Microsoft.BotService/botServices",
      ]
    }
  })

  non_compliance_message {
    content = "This resource type bills a personal card."
  }
}

resource "azurerm_subscription_policy_assignment" "deny_botservices_sku_not_f0" {
  name                 = "deny-botservices-sku-not-f0"
  display_name         = "deny-botservices-sku-not-f0"
  subscription_id      = data.azurerm_subscription.current.id
  policy_definition_id = azurerm_policy_definition.deny_botservices_sku_not_f0.id
  parameters           = jsonencode({})
}
