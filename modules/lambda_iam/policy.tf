resource "aws_iam_policy" "lambda_policy" {
  name        = "DataEngLambdaS3CWGluePolicy"
  description = "Allow lambda to interact with specified S3 buckets and use CloudWatch"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:*"],
        Resource = flatten([for bucket in var.bucket_names : [format("arn:aws:s3:::%s", bucket), format("arn:aws:s3:::%s/*", bucket)]])
      },
      {
        Effect   = "Allow",
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "arn:aws:logs:*:*:*"
      },
      {
        Effect = "Allow",
        Action = ["glue:*"],
        Resource = "*"
      }
    ],
  })
}
