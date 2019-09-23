resource "google_container_cluster" "primary" {
  name     = "primary"
  location = "asia-northeast1"

  maintenance_policy {
    daily_maintenance_window {
      start_time = "03:00"
    }
  }

  node_pool {
    node_count = 1

    node_config {
      metadata = {
        disable-legacy-endpoints = "true"
      }

      oauth_scopes = [
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
      ]

      machine_type = "g1-small"

      tags = ["webapp"]
    }
  }
}
