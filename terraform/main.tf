terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = var.google_project_id
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#provider-default-values-configuration
# set GOOGLE_CLOUD_PROJECT and GOOGLE_REGION in environment

resource "google_project" "main" {
  auto_create_network = true
  billing_account     = var.google_billing_account
  folder_id           = var.google_folder_id
  name                = "Bulk Attendance"
  project_id          = var.google_project_id
}

resource "google_project_service" "appengine_googleapis_com" {
  project = google_project.main.project_id
  service = "appengine.googleapis.com"
}

resource "google_project_service" "iap_googleapis_com" {
  project = google_project.main.project_id
  service = "iap.googleapis.com"
}

resource "google_project_service" "secretmanager_googleapis_com" {
  project = google_project.main.project_id
  service = "secretmanager.googleapis.com"
}

resource "google_app_engine_application" "main" {
  project     = google_project.main.project_id
  location_id = "us-east4"
}

resource "google_secret_manager_secret" "blackbaud_access_key" {
  secret_id = "BLACKBAUD_ACCESS_KEY"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "blackbaud_access_key_version" {
  secret      = google_secret_manager_secret.blackbaud_access_key.id
  secret_data = var.blackbaud_subscription_access_key
}

resource "google_secret_manager_secret" "blackbaud_client_id" {
  secret_id = "BLACKBAUD_CLIENT_ID"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "blackbaud_client_id_version" {
  secret      = google_secret_manager_secret.blackbaud_client_id.id
  secret_data = var.blackbaud_application_id
}

resource "google_secret_manager_secret" "blackbaud_client_secret" {
  secret_id = "BLACKBAUD_CLIENT_SECRET"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "blackbaud_client_secret_version" {
  secret      = google_secret_manager_secret.blackbaud_client_secret.id
  secret_data = var.blackbaud_application_secret
}

resource "google_secret_manager_secret" "blackbaud_redirect_url" {
  secret_id = "BLACKBAUD_REDIRECT_URL"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "blackbaud_redirect_url_version" {
  secret      = google_secret_manager_secret.blackbaud_redirect_url.id
  secret_data = format("%s/redirect", google_app_engine_application.main.default_hostname)
}

resource "google_secret_manager_secret" "student_list_id" {
  secret_id = "STUDENT_LIST_ID"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "student_list_id_version" {
  secret      = google_secret_manager_secret.student_list_id.id
  secret_data = var.blackbaud_student_list_id
}
