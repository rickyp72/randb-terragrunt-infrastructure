locals {
#  global_vars      = yamldecode(file(find_in_parent_folders("global_vars.yaml")))
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
  config_path = "../../vpc"
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
  environment_name = local.environment_vars.environment_name
}