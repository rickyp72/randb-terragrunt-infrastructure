locals {
#  global_vars      = yamldecode(file(find_in_parent_folders("global_vars.yaml")))
  account_vars     = yamldecode(file(find_in_parent_folders("account_vars.yaml")))
  environment_vars = yamldecode(file(find_in_parent_folders("environment_vars.yaml")))
}


terraform {
  source = "../../../../modules//infrastructure_jumphost"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../../vpc"
}

dependency "subnet" {
  config_path = "../../subnet"
}

inputs = {

  vpc_id = dependency.vpc.outputs.vpc_id
#  instance_type =
#  instance_profile =
  subnet_id = dependency.subnet.outputs.public_subnet_id
  private_subnet_ids = dependency.subnet.outputs.private_subnets
#  sgs       = dependency.vpc.outputs.default_vpc_sg
  resource_suffix = "${local.environment_vars.environment_name}_${local.account_vars.account_name}"
  ami_filter = "amzn2-ami-hvm-2.0.20220218.1-x86_64_ebs*"
  create_instance_profile = true
}