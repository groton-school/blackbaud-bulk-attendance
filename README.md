# Blackbaud Bulk Attendance

Upload a bulk attendance list as a CSV to Blackbaud

## Setup

Optional:

- Create a new Google Cloud Project for use with this app (using a randomly-project ID is recommended).

Mandatory:

- Update the local environment to include `GOOGLE_CLOUD_PROJECT` and `GOOGLE_REGION` values (with the project ID and desired deployment region -- e.g. `us-east4` -- respectively)
- Install dependencies

  ```bash
  pnpm install
  composer install
  ```

- [Install Terraform](https://developer.hashicorp.com/terraform/install)
- [Install Google Cloud CLI (aka `gcloud`)](https://cloud.google.com/sdk/docs/install)
- `pnpm run setup`

## Resources

See the [terraform](terraform) directory for more information on this module.
