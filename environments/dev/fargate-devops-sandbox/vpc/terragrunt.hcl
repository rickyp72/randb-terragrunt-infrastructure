locals {

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