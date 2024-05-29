variable "blackbaud_application_id" {
  type        = string
  description = "OAuth 2.0 application ID of the Blackbaud application, which can be found at https://developer.blackbaud.com/apps/"
}

variable "blackbaud_application_secret" {
  type        = string
  description = "OAuth 2.0 application secret of the Blackbaud application, which can be found at https://developer.blackbaud.com/apps/"
}

variable "blackbaud_subscription_access_key" {
  type        = string
  description = "Blackbaud SKY API subscription access key, which can be found at https://developer.blackbaud.com/subscriptions/"
}

variable "blackbaud_student_list_id" {
  type        = number
  description = "List ID of an Advanced List that lists includes Blackbaud ID, Host ID, and email, which can be found at https://YOUR_INSTANCE.myschoolapp.com/podium/default.aspx?t=23189&wapp=1&ch=1&true"
}

variable "google_folder_id" {
  type        = string
  description = "Google Cloud folder ID, which can be found at https://console.cloud.google.com/cloud-resource-manager"
  default     = ""
}

variable "google_billing_account" {
  type        = string
  description = "Google Cloud billing account ID, which can be found at https://console.cloud.google.com/billing"
}

variable "google_project_name" {
  type        = string
  description = "Google Cloud Project name"
  default     = "Bulk Attendance"
}

variable "google_project_id" {
  type        = string
  description = "Google Cloud Project ID, which can be found at https://console.cloud.google.com/home/dashboard"
}

variable "google_region" {
  type        = string
  description = "Google Region"
}
