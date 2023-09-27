#variable "policy_name" {
#  description = "The name of the IAM policy."
#  type        = string
#}
#
#variable "policy_description" {
#  description = "The description of the IAM policy."
#  type        = string
#}
#
#variable "allowed_actions" {
#  description = "The actions that are allowed by the IAM policy."
#  type        = list(string)
#  default     = ["logs:PutLogEvents", "logs:CreateLogGroup", "logs:CreateLogStream"]
#}
#
#variable "resource_arn" {
#  description = "The ARN of the resource to which the IAM policy is applied."
#  type        = string
#  default     = "arn:aws:logs:*:*:*"
#}

variable "bucket_names" {
  description = "List of S3 bucket names"
  type        = list(string)
}
