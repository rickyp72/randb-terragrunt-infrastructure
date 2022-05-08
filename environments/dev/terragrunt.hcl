terragrunt_version_constraint = ">= v0.36.10"

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
