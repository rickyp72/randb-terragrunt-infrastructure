terraform {
  source = "../../../../modules//networking/subnet"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../../networking/vpc"
}

inputs = {

  vpc_id = dependency.vpc.outputs.vpc_id
  # Set the username using the TF_VAR_db_username environment variable
  # Set the password using the TF_VAR_db_password environment variable
}