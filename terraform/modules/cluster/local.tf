locals {
  kubeconfig_name = "rundeck_${data.aws_eks_cluster.cluster.name}"

  kubeconfig = templatefile("${path.module}/kubeconfig.tpl", {
    kubeconfig_name     = local.kubeconfig_name
    rundeck_sa          = kubernetes_service_account.rundeck-sa.metadata[0].name
    endpoint            = data.aws_eks_cluster.cluster.endpoint
    cluster_auth_base64 = data.aws_eks_cluster.cluster.certificate_authority.0.data
    token               = data.kubernetes_secret.rundeck-sa-secret.data.token
  })
}
