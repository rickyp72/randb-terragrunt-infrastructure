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

inputs = {
  layer_name          = "awswranglerlayer340py310TF"
  filename            = "awswrangler-layer-3.4.0-py3.10.zip"
  compatible_runtimes = ["python3.10"]
  description         = "An example Lambda Layer"
}
