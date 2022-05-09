locals {
#  global_vars      = yamldecode(file(find_in_parent_folders("global_vars.yaml")))
  account_vars     = yamldecode(file(find_in_parent_folders("account_vars.yaml")))
  environment_vars = yamldecode(file(find_in_parent_folders("environment_vars.yaml")))
#  component_name = "${dirname(get_terragrunt_dir())}"
  component_name = "${basename(get_terragrunt_dir())}"
}


terraform {
  source = "../../../../modules//ecr"
}

include {
  path = find_in_parent_folders()
}

#dependency "vpc" {
#  config_path = "../../networking/vpc"
#}
#
#dependency "subnet" {
#  config_path = "../../networking/subnet"
#}

inputs = {
  ecr-repo-name = local.component_name
  cidr-block = "10.2.0.0/16"
#  vpc_id = dependency.vpc.outputs.vpc_id
#  instance_type =
#  instance_profile =
#  subnet_id = dependency.subnet.outputs.public_subnet_id
#  private_subnet_ids = dependency.subnet.outputs.private_subnets
##  sgs       = dependency.vpc.outputs.default_vpc_sg
#  resource_suffix = "${local.environment_vars.environment_name}-${local.account_vars.account_name}"
#  ami_filter = "amzn2-ami-hvm-2.0.20220218.1-x86_64-ebs*"
#  create_instance_profile = true
}