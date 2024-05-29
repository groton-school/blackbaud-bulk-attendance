# terraform

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.51.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_app_engine_application.main](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/app_engine_application) | resource |
| [google_project.main](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/project) | resource |
| [google_project_iam_member.appengine_service_account](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/project_iam_member) | resource |
| [google_project_service.appengine](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/project_service) | resource |
| [google_project_service.cloudbuild](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/project_service) | resource |
| [google_project_service.iap](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/project_service) | resource |
| [google_project_service.secretmanager](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/project_service) | resource |
| [google_secret_manager_secret.blackbaud_access_key](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret.blackbaud_client_id](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret.blackbaud_client_secret](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret.blackbaud_redirect_url](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret.student_list_id](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_version.blackbaud_access_key_version](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/secret_manager_secret_version) | resource |
| [google_secret_manager_secret_version.blackbaud_client_id_version](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/secret_manager_secret_version) | resource |
| [google_secret_manager_secret_version.blackbaud_client_secret_version](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/secret_manager_secret_version) | resource |
| [google_secret_manager_secret_version.blackbaud_redirect_url_version](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/secret_manager_secret_version) | resource |
| [google_secret_manager_secret_version.student_list_id_version](https://registry.terraform.io/providers/hashicorp/google/4.51.0/docs/resources/secret_manager_secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_blackbaud_application_id"></a> [blackbaud\_application\_id](#input\_blackbaud\_application\_id) | OAuth 2.0 application ID of the Blackbaud application, which can be found at https://developer.blackbaud.com/apps/ | `string` | n/a | yes |
| <a name="input_blackbaud_application_secret"></a> [blackbaud\_application\_secret](#input\_blackbaud\_application\_secret) | OAuth 2.0 application secret of the Blackbaud application, which can be found at https://developer.blackbaud.com/apps/ | `string` | n/a | yes |
| <a name="input_blackbaud_student_list_id"></a> [blackbaud\_student\_list\_id](#input\_blackbaud\_student\_list\_id) | List ID of an Advanced List that lists includes Blackbaud ID, Host ID, and email, which can be found at https://YOUR_INSTANCE.myschoolapp.com/podium/default.aspx?t=23189&wapp=1&ch=1&true | `number` | n/a | yes |
| <a name="input_blackbaud_subscription_access_key"></a> [blackbaud\_subscription\_access\_key](#input\_blackbaud\_subscription\_access\_key) | Blackbaud SKY API subscription access key, which can be found at https://developer.blackbaud.com/subscriptions/ | `string` | n/a | yes |
| <a name="input_google_billing_account"></a> [google\_billing\_account](#input\_google\_billing\_account) | Google Cloud billing account ID, which can be found at https://console.cloud.google.com/billing | `string` | n/a | yes |
| <a name="input_google_folder_id"></a> [google\_folder\_id](#input\_google\_folder\_id) | Google Cloud folder ID, which can be found at https://console.cloud.google.com/cloud-resource-manager | `string` | `""` | no |
| <a name="input_google_project_id"></a> [google\_project\_id](#input\_google\_project\_id) | Google Cloud Project ID, which can be found at https://console.cloud.google.com/home/dashboard | `string` | n/a | yes |
| <a name="input_google_project_name"></a> [google\_project\_name](#input\_google\_project\_name) | Google Cloud Project name | `string` | `"Bulk Attendance"` | no |
| <a name="input_google_region"></a> [google\_region](#input\_google\_region) | Google Region | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
