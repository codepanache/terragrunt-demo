provider "google" {
  project    = var.project_id
}

resource "google_container_cluster" "cluster" {
  for_each = {for idx,zone in var.regions: zone => idx}
  name     = var.gke_cluster_name
  location = each.key #var.cluster_location

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  network = var.vpc-id
  subnetwork = var.subnet-id[each.key]
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  for_each = {for idx,zone in var.regions: zone => idx}
  name       = var.node_pool_name
  location = var.cluster_location

  cluster    = google_container_cluster.cluster[each.key].name
  node_count = 1

  node_config {
    preemptible  = false
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

terraform {
    backend "gcs" {}
}