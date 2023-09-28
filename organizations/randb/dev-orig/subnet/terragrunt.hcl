locals {
  construct_name = "${basename(get_parent_terragrunt_dir())}"
  account_vars     = yamldecode(file(find_in_parent_folders("account_vars.yaml")))
  environment_vars = yamldecode(file(find_in_parent_folders("environment_vars.yaml")))
}


terraform {
  source = "../../../../modules//subnet"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  public_cidr_block = "10.2.10.0/24"
  private_cidr_block = "10.2.50.0/24"
  vpc_id = dependency.vpc.outputs.vpc_id
  resource_suffix = "${local.construct_name}_${local.account_vars.account_name}"
}