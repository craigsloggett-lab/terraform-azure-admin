# terraform-azure-admin

An infrastructure as code repository to manage my Azure lab.

## Prerequisites

- Terraform `~> 1.7`
- Azure credentials configured

## Deploying

1. Set the `TF_TOKEN_app_terraform_io` environment variable to an HCP Terraform
   user token.
2. Copy the example variable file and fill in the required values:

   ```sh
   cp defaults.auto.tfvars.example defaults.auto.tfvars
   ```

3. Apply the configuration:

   ```sh
   terraform init
   terraform apply
   ```

<!-- rumdl-disable MD060 -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 3.10.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 5.13.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 3.10.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 5.13.0 |

## Modules

No modules.

## Inputs

No inputs.

## Resources

| Name | Type |
| ---- | ---- |
| [azuread_app_role_assignment.channel_bridge_teams_adapter_dev_msgraph](https://registry.terraform.io/providers/hashicorp/azuread/3.10.0/docs/resources/app_role_assignment) | resource |
| [azuread_application.channel_bridge_teams_adapter_dev](https://registry.terraform.io/providers/hashicorp/azuread/3.10.0/docs/resources/application) | resource |
| [azuread_service_principal.channel_bridge_teams_adapter_dev](https://registry.terraform.io/providers/hashicorp/azuread/3.10.0/docs/resources/service_principal) | resource |
| [azuread_service_principal_delegated_permission_grant.channel_bridge_teams_adapter_dev_msgraph](https://registry.terraform.io/providers/hashicorp/azuread/3.10.0/docs/resources/service_principal_delegated_permission_grant) | resource |
| [azurerm_bot_service_azure_bot.channel_bridge_teams_adapter_dev](https://registry.terraform.io/providers/hashicorp/azurerm/5.13.0/docs/resources/bot_service_azure_bot) | resource |
| [azurerm_policy_definition.deny_botservices_sku_not_f0](https://registry.terraform.io/providers/hashicorp/azurerm/5.13.0/docs/resources/policy_definition) | resource |
| [azurerm_resource_group.channel_bridge_teams_adapter_dev](https://registry.terraform.io/providers/hashicorp/azurerm/5.13.0/docs/resources/resource_group) | resource |
| [azurerm_subscription_policy_assignment.allowed_resource_types](https://registry.terraform.io/providers/hashicorp/azurerm/5.13.0/docs/resources/subscription_policy_assignment) | resource |
| [azurerm_subscription_policy_assignment.deny_botservices_sku_not_f0](https://registry.terraform.io/providers/hashicorp/azurerm/5.13.0/docs/resources/subscription_policy_assignment) | resource |
| [azuread_application_published_app_ids.well_known](https://registry.terraform.io/providers/hashicorp/azuread/3.10.0/docs/data-sources/application_published_app_ids) | data source |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/3.10.0/docs/data-sources/client_config) | data source |
| [azuread_service_principal.msgraph](https://registry.terraform.io/providers/hashicorp/azuread/3.10.0/docs/data-sources/service_principal) | data source |
| [azuread_user.craig_sloggett](https://registry.terraform.io/providers/hashicorp/azuread/3.10.0/docs/data-sources/user) | data source |
| [azurerm_policy_definition_built_in.allowed_resource_types](https://registry.terraform.io/providers/hashicorp/azurerm/5.13.0/docs/data-sources/policy_definition_built_in) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/5.13.0/docs/data-sources/subscription) | data source |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_entra_object_id"></a> [entra\_object\_id](#output\_entra\_object\_id) | The object ID of the Entra principal the azuread provider is authenticated as. |
| <a name="output_entra_tenant_id"></a> [entra\_tenant\_id](#output\_entra\_tenant\_id) | The ID of the Entra tenant the azuread provider is authenticated against. |
| <a name="output_subscription_display_name"></a> [subscription\_display\_name](#output\_subscription\_display\_name) | The display name of the subscription the azurerm provider is configured for. |
| <a name="output_subscription_id"></a> [subscription\_id](#output\_subscription\_id) | The ID of the subscription the azurerm provider is configured for. |
<!-- END_TF_DOCS -->
<!-- rumdl-enable MD060 -->
