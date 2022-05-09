module "fargate-devops-sandbox-ecr-repo" {
  source = "../../modules/ecr/"
  ecr-repo-name = var.ecr-repo-name
  resource_suffix = var.resource_suffix
}
