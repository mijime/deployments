provider "google" {
  version = "~> 2.15"

  project = var.project_id
}

provider "kubernetes" {
  version = "~> 1.9.0"

  host = google_container_cluster.primary.endpoint

  client_certificate     = base64decode(google_container_cluster.primary.master_auth.0.client_certificate)
  client_key             = base64decode(google_container_cluster.primary.master_auth.0.client_key)
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
}
