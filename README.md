# Blackbaud Bulk Attendance

Upload a bulk attendance list as a CSV to Blackbaud

## Setup

Optionally:

- Create a new Google Cloud Project for use with this app (using a randomly-project ID is recommended).

Mandatory:

- Update the local environment to include `GOOGLE_CLOUD_PROJECT` and `GOOGLE_REGION` values (with the project ID and desired deployment region -- e.g. `us-east4` -- respectively)
- [Install Terraform](https://developer.hashicorp.com/terraform/install) (more information in the [terraform](terraform) directory)
- [Install Google Cloud CLI (aka `gcloud`)](https://cloud.google.com/sdk/docs/install)
- `npm run setup`
