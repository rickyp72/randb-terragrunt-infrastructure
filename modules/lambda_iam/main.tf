#resource "aws_iam_policy" "lambda_s3_policy" {
#  description = "Allow lambda to use cloudwatch"
#  policy = jsonencode({
#    Version = "2012-10-17",
#    Statement = [
#      {
#        Effect   = "Allow",
#        Action   = [
#          "s3:*"
#        ],
#        Resource = var.s3_buckets
#      }
#    ]
#  })
#}

resource "aws_iam_policy" "lambda_s3_policy" {
  description = "Allow lambda to interact with specified S3 buckets"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:*"],
#        Resource = [for bucket in var.bucket_names : format("arn:aws:s3:::%s/*", bucket)]
        Resource = flatten([for bucket in var.bucket_names : [format("arn:aws:s3:::%s", bucket), format("arn:aws:s3:::%s/*", bucket)]])
      }
    ]
  })
}


resource "aws_iam_policy" "lambda_cloudwatch_policy" {
  description = "Allow lambda to use cloudwatch"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}
