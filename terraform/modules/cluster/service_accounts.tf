resource "kubernetes_service_account" "rundeck-sa" {
  metadata {
    name      = "rundeck-sa"
    namespace = "kube-system"
  }
}

data "kubernetes_secret" "rundeck-sa-secret" {
  metadata {
    name      = kubernetes_service_account.rundeck-sa.default_secret_name
    namespace = "kube-system"
  }
}
