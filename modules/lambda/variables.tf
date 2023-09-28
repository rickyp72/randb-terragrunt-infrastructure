#### Lambda Layer vars

variable "layer_name" {}
variable "filename" {}
variable "compatible_runtimes" {
  type = list(string)
}
variable "description" {}


#### Lambda vars
variable "function_name" {
  description = "The name of the Lambda function."
  default     = "example_lambda"
}

variable "handler" {
  description = "The handler for the Lambda function."
  default     = "index.handler"
}

variable "runtime" {
  description = "The runtime environment for the Lambda function."
  default     = "nodejs14.x"
}

variable "role_arn" {
  description = "The name of the IAM role for the Lambda function."
  default     = "example_lambda_role"
}

variable "lambda_zip_file" {
  description = "The path to the Lambda function's deployment package."
  default     = "lambda_function_payload.zip"
}

