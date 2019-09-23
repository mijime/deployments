resource "kubernetes_ingress" "webapp" {
  metadata {
    name = "webapp"
  }

  spec {
    rule {
      http {
        path {
          backend {
            service_name = "webapp"
            service_port = 8080
          }

          path = "/*"
        }
      }
    }
  }
}

resource "kubernetes_service" "webapp" {
  metadata {
    name = "webapp"
  }

  spec {
    selector = {
      app = "webapp"
    }

    port {
      port        = 8080
      target_port = 80
    }

    type = "NodePort"
  }
}

resource "kubernetes_deployment" "webapp" {
  metadata {
    name = "webapp"

    labels = {
      app = "webapp"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "webapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "webapp"
        }
      }

      spec {
        container {
          name  = "webapp"
          image = "nginx:latest"
        }
      }
    }
  }
}
