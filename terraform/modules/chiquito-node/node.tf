
resource "kubernetes_pod" "chiquito-pod" {

  metadata {
    name = "chiquito-pod"
    namespace = "chiquito-local"
    labels = {
      app = "chiquito-nginx"
    }
  }
  spec {
    container {
      image = "chiquito/app"
      name  = "app"
      image_pull_policy = "Never"

      port { container_port = 8080 }
    }
    container {
      image = "chiquito/nginx-k8s"
      name  = "chiquito-nginx"
      image_pull_policy = "Never"


      env {
        name  = "environment"
        value = "local"
      }

      port {
        container_port = 80
      }
    }

  }
}
