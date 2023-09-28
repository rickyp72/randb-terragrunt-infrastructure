locals {
  construct_name = "${basename(get_parent_terragrunt_dir())}"
  account_vars     = yamldecode(file(find_in_parent_folders("account_vars.yaml")))
  environment_vars = yamldecode(file(find_in_parent_folders("environment_vars.yaml")))
}

terraform {
  source = "../../../../modules//lambda"
}

include {
  path = find_in_parent_folders()
}

dependency "lambda_role" {
  config_path = "../lambda_iam"
}

inputs = {
  layer_name          = "awswranglerlayer340py310TF"
  filename            = "awswrangler-layer-3.4.0-py3.10.zip"
  compatible_runtimes = ["python3.10"]
  description         = "AWS Data Wrangler lambda layer"

  function_name    = "CSVtoParquetLambda"
  handler          = "index.handler"
  runtime          = "python3.10"
  role_arn         = dependency.lambda_role.outputs.DataEngLambdaS3CWGlueRole_arn
  lambda_zip_file  = "CSVtoParquetLambda.py.zip"
}
