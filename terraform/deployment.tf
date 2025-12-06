resource "kubernetes_deployment" "winning" {
  metadata {
    name = "winning-number-service"
    labels = {
      app = "winning-number-service"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "winning-number-service"
      }
    }
    template {
      metadata {
        labels = {
          app = "winning-number-service"
        }
      }
      spec {
        container {
          name  = "winning-number-service"
          image = var.image_tag
          port {
            container_port = 8086
          }
        }
      }
    }
  }
}
