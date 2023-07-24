output "cluster_id" {
  description = "an identifier for the resource with format projects/{{project}}/locations/{{zone}}/clusters/{{name}}"
  value       = google_container_cluster.gke.id
}

output "cluster_master_version" {
  description = "The current version of the master in the cluster. This may be different than the min_master_version set in the config if the master has been updated by GKE."
  value       = google_container_cluster.gke.master_version
}

output "client_certificate" {
  description = "Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster."
  value       = google_container_cluster.gke.master_auth.0.client_certificate
  sensitive   = true
}

output "client_key" {
  description = "Base64 encoded private key used by clients to authenticate to the cluster endpoint."
  value       = google_container_cluster.gke.master_auth.0.client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "Base64 encoded public certificate that is the root certificate of the cluster."
  value       = google_container_cluster.gke.master_auth.0.cluster_ca_certificate
  sensitive   = true
}

output "endpoint" {
  description = "The IP address of this cluster's Kubernetes master."
  value       = google_container_cluster.gke.endpoint
}