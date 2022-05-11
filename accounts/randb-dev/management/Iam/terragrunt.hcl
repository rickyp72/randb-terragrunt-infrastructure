locals {

}


terraform {
  source = "../../../../modules//iam"
}

include {
  path = find_in_parent_folders()
}


inputs = {
  cidr_block = "10.2.0.0/16"
}