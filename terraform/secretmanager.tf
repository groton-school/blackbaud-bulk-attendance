resource "google_project_service" "secretmanager" {
  project = google_project.main.project_id
  service = "secretmanager.googleapis.com"
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
  secret_data = "${google_app_engine_application.main.default_hostname}/redirect"
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
