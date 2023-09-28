#provider "aws" {
#  region = "eu-west-2"
#}

resource "aws_lambda_layer_version" "lambda_layer" {
  layer_name          = var.layer_name
  filename            = var.filename
  source_code_hash    = filebase64sha256(var.filename)
  compatible_runtimes = var.compatible_runtimes
  description         = var.description
}


