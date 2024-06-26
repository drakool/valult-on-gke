/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "google_service_account" "deploy_service_account" {
  project      = var.project_id
  account_id   = var.service_account
  display_name = "Cloud Deploy Deployment service account"
}

resource "google_project_iam_member" "jobrunner_binding" {
  project = var.project_id
  role    = "roles/clouddeploy.jobRunner"
  member  = "serviceAccount:${google_service_account.deploy_service_account.email}"
}

resource "google_project_iam_member" "developer_binding" {
  project = var.project_id
  role    = "roles/container.developer"
  member  = "serviceAccount:${google_service_account.deploy_service_account.email}"
}

resource "google_project_iam_member" "project" {
  project = var.project_id
  role    = "roles/storage.buckets.create"
  member  = "serviceAccount:${google_service_account.deploy_service_account.email}"
}

/* Vault secret and keyring.
Create the Cloud KMS encryption key that will be used to encrypt and decrypt the Vault master key: */

resource "google_project_iam_member" "secret_binding" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_service_account.deploy_service_account.email}"
}

/*Grant the necessary permissions on the seal Cloud KMS encryption key for the vault-server service account: */

resource "google_project_iam_member" "seal_binding" {
  project = var.project_id
  role    = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member  = "serviceAccount:${google_service_account.deploy_service_account.email}"
}
