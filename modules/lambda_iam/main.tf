resource "aws_iam_policy" "lamdba_cloudwatch_policy" {
  description = "Allow lambda to use cloudwatch"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = var.allowed_cloudwatch_actions,
        Resource = var.resource_arn
      }
    ]
  })
}

resource "aws_iam_policy" "lamdba_other_policy" {
  description = var.policy_description
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = var.allowed_actions,
        Resource = var.resource_arn
      }
    ]
  })
}