output "DataEngLambdaS3CWGlueRole_arn" {
  value       = aws_iam_role.DataEngLambdaS3CWGlueRole.arn
  description = "The ARN of the IAM role DataEngLambdaS3CWGlueRole"
}