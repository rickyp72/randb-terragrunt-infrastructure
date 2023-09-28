resource "aws_lambda_function" "DataEng_CSVtoParquet_lambda" {
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime

  role          = var.role_arn

  filename         = var.lambda_zip_file
  source_code_hash = filebase64sha256(var.lambda_zip_file)

#  layers = aws_lambda_layer_version.lambda_layer.arn
  layers = [aws_lambda_layer_version.lambda_layer.arn]
}

