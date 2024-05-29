resource "google_project_service" "iap" {
  project = google_project.main.project_id
  service = "iap.googleapis.com"
}

resource "google_iap_brand" "main" {
  support_email     = var.google_oauth_support_email
  application_title = var.google_project_name
}

resource "google_iap_client" "main" {
  display_name = "IAP-App-Engine-app"
  brand        = google_iap_brand.main.name
}

resource "google_project_iam_binding" "iap_users" {
  role    = "roles/iap.httpsResourceAccessor"
  members = [for u in var.google_iap_users : "${u.type}:${u.email}"]
  project = google_project.main.project_id
}


