resource "aws_ecr_repository" "ecr_repo" {
  name = "${var.resource_suffix}-ecr-repo"
}
