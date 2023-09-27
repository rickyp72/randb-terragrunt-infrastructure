locals {
  construct_name = "${basename(get_parent_terragrunt_dir())}"
  account_vars     = yamldecode(file(find_in_parent_folders("account_vars.yaml")))
  environment_vars = yamldecode(file(find_in_parent_folders("environment_vars.yaml")))
}

terraform {
  source = "../../../../modules//s3"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  bucket_name = "${local.construct_name}-${local.account_vars.account_name}-dataeng-clean-zone"
  tags = {
    Owner       = "Ricky"
    Environment = "randb-dev"
  }
}
