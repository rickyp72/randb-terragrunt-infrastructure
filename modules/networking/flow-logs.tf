## VPC flow logs
#resource "aws_flow_log" "main" {
#  iam_role_arn    = aws_iam_role.flow-log.arn
#  log_destination = aws_cloudwatch_log_group.flow-log.arn
#  traffic_type    = "ALL"
#  vpc_id          = var.vpc_id
#}
#
#resource "aws_cloudwatch_log_group" "flow-log" {
#  name = "rbpops-${var.environment_name}-vpc-flow-log"
##  kms_key_id = var.cloudwatch_kms_key_arn
#}
#
#resource "aws_iam_role" "flow-log" {
#  name               = "rbpops-${var.environment_name}-vpc-flow-log"
#  assume_role_policy = <<EOF
#{
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Sid": "",
#      "Effect": "Allow",
#      "Principal": {
#        "Service": "vpc-flow-logs.amazonaws.com"
#      },
#      "Action": "sts:AssumeRole"
#    }
#  ]
#}
#EOF
#}
#
#resource "aws_iam_role_policy" "flow-log" {
#  name   = "rbpops-${var.environment_name}-vpc-flow-log"
#  role   = aws_iam_role.flow-log.id
#  policy = <<EOF
#{
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Action": [
#        "logs:CreateLogGroup",
#        "logs:CreateLogStream",
#        "logs:PutLogEvents",
#        "logs:DescribeLogGroups",
#        "logs:DescribeLogStreams"
#      ],
#      "Effect": "Allow",
#      "Resource": "*"
#    }
#  ]
#}
#EOF
#}