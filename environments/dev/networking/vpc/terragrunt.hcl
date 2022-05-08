terraform {
  source = "../../../../modules//networking/vpc"
}

include {
  path = find_in_parent_folders()
}

inputs = {


  # Set the username using the TF_VAR_db_username environment variable
  # Set the password using the TF_VAR_db_password environment variable
}