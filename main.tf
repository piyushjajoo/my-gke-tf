# to use s3 backend 
# s3 bucket is configured at command line
terraform {
  backend "s3" {}
}

# setup google provider
# the environment variables below will be set before invoking the module
# GOOGLE_CREDENTIALS - path/to/service/account/credentials/file
# GOOGLE_PROJECT - google project id where the resources need to be created
provider "google" {}

# invoke cluster module which creates vpc, subnet and gke cluter with a default worker nodepool
module "cluster" {
  source = "./cluster"

  region       = var.region
  cluster_name = var.cluster_name
  k8s_version  = var.k8s_version
}