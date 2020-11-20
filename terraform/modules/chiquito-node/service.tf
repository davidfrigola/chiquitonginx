resource "kubernetes_service" "chiquito-service" {
  metadata {
    name = "chiquito-service"
    namespace = "chiquito-local"
    labels = {
      test = "chiquito-test"
    }
  }
  spec {
    selector = {
      system = "chiquito-system"
    }
    port {
      port        = 80
      target_port = 80
    }

  }
}
