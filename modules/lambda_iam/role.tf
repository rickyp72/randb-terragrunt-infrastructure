resource "aws_iam_role" "DataEngLambdaS3CWGlueRole" {
  name               = "DataEngLambdaS3CWGlueRole"
  description        = "IAM role for Data Engineering Lambda with S3, CloudWatch, and Glue permissions"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_combined_policy_attachment" {
  role       = aws_iam_role.DataEngLambdaS3CWGlueRole.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}