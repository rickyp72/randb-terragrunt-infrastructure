locals {
  construct_name = "${basename(get_parent_terragrunt_dir())}"
  account_vars     = yamldecode(file(find_in_parent_folders("account_vars.yaml")))
  environment_vars = yamldecode(file(find_in_parent_folders("environment_vars.yaml")))
}


terraform {
  source = "../../../../modules//vpc"
}

include {
  path = find_in_parent_folders()
}


inputs = {
  cidr_block = "10.2.0.0/16"
  resource_suffix = "${local.construct_name}_${local.account_vars.account_name}"
}
