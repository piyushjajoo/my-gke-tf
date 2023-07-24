# setup google terraform provider
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.74.0"
    }
  }
}

# VPC - https://registry.terraform.io/providers/hashicorp/google/4.74.0/docs/resources/compute_network
resource "google_compute_network" "vpc" {
  name        = var.vpc_name
  description = var.vpc_description

  # the network is created in "custom subnet mode"
  # we will explicitly connect subnetwork resources below using google_compute_subnetwork resource
  auto_create_subnetworks = "false"
}

# Subnet - https://registry.terraform.io/providers/hashicorp/google/4.74.0/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  description   = var.subnet_description
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.cidrBlock
}