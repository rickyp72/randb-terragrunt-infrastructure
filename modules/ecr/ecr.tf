resource "aws_ecr_repository" "ecr_repo" {
  name = "${var.ecr-repo-name}-${var.resource_suffix}"
}
