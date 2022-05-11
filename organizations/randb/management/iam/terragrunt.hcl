locals {
  account_vars = yamldecode(file(find_in_parent_folders("account_vars.yaml")))
  organization_vars = yamldecode(file(find_in_parent_folders("organization_vars.yaml")))
}


terraform {
  source = "../../../../modules//management_iam"
}

include {
  path = find_in_parent_folders()
}


inputs = {
  cross_account = local.organization_vars.dev_account_number
}