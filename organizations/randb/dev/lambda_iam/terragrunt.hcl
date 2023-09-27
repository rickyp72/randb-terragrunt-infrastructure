locals {
  construct_name = "${basename(get_parent_terragrunt_dir())}"
  account_vars     = yamldecode(file(find_in_parent_folders("account_vars.yaml")))
  environment_vars = yamldecode(file(find_in_parent_folders("environment_vars.yaml")))
}

terraform {
  source = "../../../../modules//lambda_iam"
}

include {
  path = find_in_parent_folders()
}

#inputs = {
##  policy_name       = "lambda_cloudwatch_policy"
##  policy_description = "Policy to allow lambda to use cloudwatch logs"
#  # The allowed_actions and resource_arn variables have default values, so they are optional here.
#  bucket_names = ["example-bucket-1", "example-bucket-2"]
#}



dependency "s3_clean_bucket" {
  config_path = "../s3_clean_zone"
}

dependency "s3_landing_bucket" {
  config_path = "../s3_landing_zone"
}

inputs = {
  bucket_names = [
    dependency.s3_clean_bucket.outputs.bucket_name,
    dependency.s3_landing_bucket.outputs.bucket_name
  ]
}