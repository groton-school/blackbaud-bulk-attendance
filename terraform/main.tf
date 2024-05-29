terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

# provider.project is automatically applied to many resources
# GOOGLE_REGION is set in environment, and also read
provider "google" {
  project = var.google_project_id
  region  = var.google_region
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#provider-default-values-configuration
# set GOOGLE_CLOUD_PROJECT and GOOGLE_REGION in environment

resource "google_project" "main" {
  auto_create_network = true
  billing_account     = var.google_billing_account
  folder_id           = var.google_folder_id
  name                = var.google_project_name
  project_id          = var.google_project_id
}
