data "aws_iam_policy_document" "assume_role_from_management" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    condition {
      test     = "BoolIfExists"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.management_account}:root"]
    }
  }
}