resource "kubernetes_ingress" "chiquito_ingress" {
  metadata {
    name = "chiquito-ingress"
    namespace = "chiquito-local"
  }

  spec {
    backend {
      service_name = "chiquito-service"
      service_port = 80
    }
  }
}
