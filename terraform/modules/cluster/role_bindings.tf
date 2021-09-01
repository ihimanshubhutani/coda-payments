resource "kubernetes_cluster_role_binding" "rudeck-sa-rolebinding" {
  metadata {
    name = "rudeck-sa-rolebinding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.rundeck-sa.metadata[0].name
    namespace = "kube-system"
  }
}
