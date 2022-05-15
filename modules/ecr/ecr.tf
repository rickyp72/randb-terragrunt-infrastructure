resource "aws_ecr_repository" "repo" {
#  name = "${var.resource_suffix}_ecr_repo"
  name = "${var.resource_suffix}"
}
