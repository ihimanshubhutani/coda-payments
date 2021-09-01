data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}

# Ingress to connect to the service
resource "helm_release" "ingress" {
  name       = "eks"
  chart      = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  version    = "1.1.3"

  set {
    name  = "clusterName"
    value = "coda-payment-rest-api-dev2"
  }
}

resource "aws_iam_policy" "worker_policy" {
  name        = "worker-policy"
  description = "Worker policy for the ALB Ingress"

  policy = file("${path.module}/iam-policy.json")
}

# Creating EKS cluster
module "eks" {
  source                               = "terraform-aws-modules/eks/aws"
  cluster_name                         = "${var.cluster_name}-${var.application}-${var.environment}"
  cluster_version                      = "1.17"
  subnets                              = [var.public-subnet-id, var.private-subnet1-id]
  vpc_id                               = var.vpc-id
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
  workers_additional_policies          = [aws_iam_policy.worker_policy.arn]

  node_groups = {
    ng1 = {
      subnets             = [var.private-subnet1-id]
      desired_capacity    = var.desired_capacity
      max_capacity        = var.max_capacity
      min_capacity        = var.min_capacity
      suspended_processes = ["AZRebalance"]

      instance_types = ["t2.medium"]
      k8s_labels = {
        environment = "development"
        subnet_type = "private"
        node        = "ng1"
      }
    }
  }
}
