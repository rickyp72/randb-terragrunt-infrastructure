## VPC flow logs
#resource "aws_flow_log" "main" {
#  iam_role_arn    = aws_iam_role.flow_log.arn
#  log_destination = aws_cloudwatch_log_group.flow_log.arn
#  traffic_type    = "ALL"
#  vpc_id          = var.vpc_id
#}
#
#resource "aws_cloudwatch_log_group" "flow_log" {
#  name = "rbpops_${var.environment_name}_vpc_flow_log"
##  kms_key_id = var.cloudwatch_kms_key_arn
#}
#
#resource "aws_iam_role" "flow_log" {
#  name               = "rbpops_${var.environment_name}_vpc_flow_log"
#  assume_role_policy = <<EOF
#{
#  "Version": "2012_10_17",
#  "Statement": [
#    {
#      "Sid": "",
#      "Effect": "Allow",
#      "Principal": {
#        "Service": "vpc_flow_logs.amazonaws.com"
#      },
#      "Action": "sts:AssumeRole"
#    }
#  ]
#}
#EOF
#}
#
#resource "aws_iam_role_policy" "flow_log" {
#  name   = "rbpops_${var.environment_name}_vpc_flow_log"
#  role   = aws_iam_role.flow_log.id
#  policy = <<EOF
#{
#  "Version": "2012_10_17",
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