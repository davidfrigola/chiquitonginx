resource "kubernetes_deployment" "chiquito-deployment" {
  metadata {
    name = "chiquito-deployment"
    namespace = "chiquito-local"
    labels = {
      test = "chiquito-test"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = "chiquito-test"
      }
    }

    template {
      metadata {
        labels = {
          test = "chiquito-test"
        }
      }

      spec {
        container {
          image = "chiquito/app"
          name  = "app"
          image_pull_policy = "Never"
          port { container_port = 8080 }
          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/200"
              port = 8080

            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
        container {
          image = "chiquito/nginx-simple"
          name  = "chiquito-nginx"
          image_pull_policy = "Never"

          port {
            container_port = 80
          }

          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
          liveness_probe {
            http_get {
              path = "/200"
              port = 80

            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }

      }
    }
  }
}
