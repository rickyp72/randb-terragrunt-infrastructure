locals {
#  global_vars      = yamldecode(file(find_in_parent_folders("global_vars.yaml")))
  account_vars     = yamldecode(file(find_in_parent_folders("account_vars.yaml")))
  environment_vars = yamldecode(file(find_in_parent_folders("environment_vars.yaml")))
  component_name = "${basename(get_terragrunt_dir())}"
}


terraform {
  source = "../../../../modules//networking/vpc"
}

include {
  path = find_in_parent_folders()
}


inputs = {
  cidr-block = "10.2.0.0/16"
}