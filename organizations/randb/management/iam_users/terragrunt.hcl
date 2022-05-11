locals {
  account_vars = yamldecode(file(find_in_parent_folders("account_vars.yaml")))
  organization_vars = yamldecode(file(find_in_parent_folders("organization_vars.yaml")))
}


terraform {
  source = "../../../../modules//iam_user"
}

include {
  path = find_in_parent_folders()
}


inputs = {
  name = "joe.bloggs"
  groups = ["infrastructure_engineers"]
}