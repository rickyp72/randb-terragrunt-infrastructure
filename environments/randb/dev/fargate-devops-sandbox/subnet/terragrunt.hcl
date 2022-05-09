locals {

}


terraform {
  source = "../../../../../modules//subnet"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  public-cidr-block = "10.2.10.0/24"
  private-cidr-block = "10.2.50.0/24"
  vpc_id = dependency.vpc.outputs.vpc_id
}