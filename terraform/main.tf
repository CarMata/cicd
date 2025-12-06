resource "kubernetes_deployment" "winning" {
  metadata {
    name = var.app_name
    labels = { app = "winning-number-service" }
  }

  spec {
    replicas = 1

    selector {
      match_labels = { app = "winning-number-service" }
    }

    template {
      metadata {
        labels = { app = "winning-number-service" }
      }
      spec {
        container {
          name  = var.app_name
          image = "carmata/winning-number-service:latest"
          port {
            container_port = 8086
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "winning" {
  metadata {
    name = var.app_name
  }

  spec {
    selector = { app = "winning-number-service" }
    port {
      port        = 8086
      target_port = 8086
    }
    type = "NodePort"
  }
}


