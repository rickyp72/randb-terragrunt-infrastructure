locals {
  account_vars = yamldecode(file(find_in_parent_folders("account_vars.yaml")))
  organization_vars = yamldecode(file(find_in_parent_folders("organization_vars.yaml")))
}


terraform {
  source = "../../../../modules//iam"
}

include {
  path = find_in_parent_folders()
}


inputs = {
  management_account = local.organization_vars.management_account_number
}