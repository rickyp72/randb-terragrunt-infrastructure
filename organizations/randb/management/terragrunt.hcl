terragrunt_version_constraint = ">= v0.36.10"

locals {
  account_vars = yamldecode(file(find_in_parent_folders("account_vars.yaml")))
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = get_env("TEST_STATE_S3_BUCKET", "randb-tfstate")
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = get_env("TEST_STATE_REGION", "eu-west-2")
    encrypt        = true
    dynamodb_table = get_env("TEST_STATE_DYNAMODB_TABLE", "")
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "eu-west-2"
  allowed_account_ids = ["${local.account_vars.account_number}"]
}
EOF
}