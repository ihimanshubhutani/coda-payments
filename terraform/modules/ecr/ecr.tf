# ECR repository to push the image
resource "aws_ecr_repository" "image_registry" {
  name                 = "coda-test-task"
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }
}

