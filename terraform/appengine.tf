resource "google_project_service" "appengine" {
  project = google_project.main.project_id
  service = "appengine.googleapis.com"
}

resource "google_project_service" "cloudbuild" {
  project = google_project.main.project_id
  service = "cloudbuild.googleapis.com"
}

resource "google_app_engine_application" "main" {
  project     = google_project.main.project_id
  location_id = var.google_region
  iap {
    enabled              = true
    oauth2_client_id     = google_iap_client.main.client_id
    oauth2_client_secret = var.google_oauth_secret
  }
}

resource "google_project_iam_member" "appengine_service_account" {
  for_each = toset([
    "roles/secretmanager.secretAccessor"
  ])
  role    = each.key
  member  = "serviceAccount:${google_project.main.project_id}@appspot.gserviceaccount.com"
  project = google_project.main.project_id
}
