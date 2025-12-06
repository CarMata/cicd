resource "kubernetes_service" "winning" {
  metadata {
    name = var.app_name
  }

  spec {
    selector = {
      app = var.app_name
    }

    port {
      port        = var.container_port
      target_port = var.container_port
      node_port   = var.node_port
    }

    type = "NodePort"
  }
}

