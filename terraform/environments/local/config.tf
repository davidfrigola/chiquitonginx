terraform {

  backend "local" {
    path = "../../local-terraform.tfstate"
  }
}


provider "kubernetes" {
  config_context_cluster   = "minikube"

}

resource "kubernetes_namespace" "chiquito" {
  metadata {
    name = "chiquito-local"
  }
}

module "node" {
  source = "../../modules/chiquito-node"

}
