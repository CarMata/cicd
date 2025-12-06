resource "kubernetes_deployment" "winning" {
  metadata {
    name = var.app_name
    labels = {
      app = "winning-number-service"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = var.app_name
      }
    }
    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }
      spec {
        container {
          name  = var.app_name
          image = var.image_tag
          port {
            container_port = 8086
          }
        }
      }
    }
  }
}

