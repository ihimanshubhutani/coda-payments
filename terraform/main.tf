# Module to create a VPC network
module "vpc_network" {
  source             = "./modules/vpc"
  cluster_name       = var.cluster_name
  environment        = var.environment
  application        = var.application
  region             = var.region
  availability_zone  = var.availability_zone
  availability_zone2 = var.availability_zone2
}

# Module to Create ECR repository
module "ecr" {
  source               = "./modules/ecr"
  image_tag_mutability = var.image_tag_mutability
}

# Module to create a cluster
module "cluster" {
  source             = "./modules/cluster"
  cluster_name       = var.cluster_name
  environment        = var.environment
  application        = var.application
  region             = var.region
  availability_zone  = var.availability_zone
  availability_zone2 = var.availability_zone2
  desired_capacity   = var.desired_capacity
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
  node_lifecycle     = var.node_lifecycle
  vpc-id             = module.vpc_network.vpc-id
  private-subnet1-id = module.vpc_network.private-subnet1-id
  public-subnet-id   = module.vpc_network.public-subnet-id
}
