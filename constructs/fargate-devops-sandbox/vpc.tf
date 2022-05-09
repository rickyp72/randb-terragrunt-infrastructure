module "ecs_vpc" {
  source = "../../modules/networking/vpc"
  cidr-block = var.cidr-block
}