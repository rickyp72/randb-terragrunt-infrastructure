resource "aws_iam_user" "this" {
  name          = var.name
#  force_destroy = true
#  tags = {
#    Managed_by   = "Terraform"
#    Name         = "${var.environment}.${var.name}.iam_user"
#    Organisation = var.user_data["organisation"]
#  }
}

resource "aws_iam_user_group_membership" "this" {
  user   = aws_iam_user.this.name
  groups = var.groups
}

#resource "aws_iam_user_policy_attachment" "policy_attachment" {
#  for_each   = toset(var.attach_policy_arns)
#  user       = aws_iam_user.this.name
#  policy_arn = each.key
#}
