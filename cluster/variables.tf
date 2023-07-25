variable "cluster_name" {
  type        = string
  description = "vpc, subnet and gke cluster name"
}

variable "k8s_version" {
  type        = string
  description = "kubernetes version"
  default     = "1.27"
}

variable "region" {
  type        = string
  description = "gcp region where the gke cluster must be created, this region should match where you have created the vpc and subnet"
}

variable "cidrBlock" {
  type        = string
  description = "The cidr block for subnet"
  default     = "10.1.0.0/16"
}

variable "nodepools" {
  description = "Nodepools for the Kubernetes cluster"
  type = map(object({
    name         = string
    node_count   = number
    node_labels  = map(any)
    machine_type = string
  }))
  default = {
    worker = {
      name         = "worker"
      node_labels  = { "worker-name" = "worker" }
      machine_type = "n1-standard-1"
      node_count   = 1
    }
  }
}
