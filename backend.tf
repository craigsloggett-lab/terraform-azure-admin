# Use the TF_TOKEN_app_terraform_io to set a User Token to authenticate with HCP Terraform.

terraform {
  cloud {
    organization = "redpanda-data"

    workspaces {
      project = "forward-deployed-engineering"
      name    = "fde-azure-admin"
    }
  }
}
