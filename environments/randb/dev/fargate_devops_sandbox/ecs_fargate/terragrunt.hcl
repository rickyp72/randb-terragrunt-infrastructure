locals {

}

terraform {
  source = "../../../../../modules//ecs"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "subnet" {
  config_path = "../subnet"
}


inputs = {
  vpc_cidr_block = dependency.vpc.outputs.vpc_cidr_block
#  subnet_id = dependency.subnet.outputs.public_subnet_id
#  private_subnet_ids = dependency.subnet.outputs.private_subnets
}