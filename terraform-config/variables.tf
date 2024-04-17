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

variable "project_id" {
  description = "The project ID to host the cluster in"
}

variable "region" {
  description = "GCP region in which to build the infrastructure"
}

variable "service_account"{
  description = "the service account allowed to deploy using skaffold and cloud deploy"
}
variable "gke_asn" {
  default     = "64513"
  description = "ASN for GKE side VPN"
}

variable "gcb_asn" {
  default     = "64514"
  description = "ASN for GCB side VPN"
}

variable "test_cluster_master_cidr" {
  default     = "172.16.0.0/28"
  description = "Test cluster master CIDR"
}

variable "staging_cluster_master_cidr" {
  default     = "172.16.1.0/28"
  description = "Staging cluster master CIDR"
}

variable "prod_cluster_master_cidr" {
  default     = "172.16.2.0/28"
  description = "Prod cluster master CIDR"
}

variable "private_pool_address" {
  default     = "172.17.0.0"
  description = "Start of Private Pool address block"
}

variable "private_pool_prefix" {
  default     = "16"
  description = "Size of Private Pool address block"
}


/* vault section */


variable "kms_keyring" {
  type        = string
  default     = "vault"
  description = "Name of the GCP KMS keyring"
}

variable "kms_crypto_key" {
  type        = string
  default     = "vault-init"
  description = "Name of the GCP KMS crypto key"
}

variable "load_balancing_scheme" {
  type        = string
  default     = "EXTERNAL"
  description = "e.g. [INTERNAL|EXTERNAL]. Scheme of the load balancer"
}

variable "allow_public_egress" {
  type        = bool
  default     = true
  description = "Whether to create a NAT for external egress. If false, you must also specify an http_proxy to download required executables including Vault, Fluentd and Stackdriver"
}
