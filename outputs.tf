output "endpoint" {
  description = "The IP address of this cluster's Kubernetes master."
  value       = module.cluster.endpoint
}