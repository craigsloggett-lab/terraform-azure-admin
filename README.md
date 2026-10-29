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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 5.11.0 |

## Providers

No providers.

## Modules

No modules.

## Inputs

No inputs.

## Resources

No resources.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
