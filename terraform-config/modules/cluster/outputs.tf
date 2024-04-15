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

output "service_account" {
  value       = module.delivery_platform_cluster.service_account
  description = "Service account used to create the cluster and node pool(s)"
}

output "region" {
  value       = var.region
  description = "Region for development cluster"
}

output "cluster_name" {
  value       = var.name
  description = "Cluster Name"
}

output "endpoint" {
  value       = module.delivery_platform_cluster.endpoint
  description = "Cluster endpoint used to identify the cluster"
}

output "peering_name" {
  value       = module.delivery_platform_cluster.peering_name
  description = "Cluster peering name"
}
