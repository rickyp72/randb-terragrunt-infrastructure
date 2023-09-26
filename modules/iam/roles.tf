# InfrastructureEngineer
resource "aws_iam_role" "infrastructure_engineer" {
  description           = "Infrastructure engineer role"
  name                  = "InfrastructureEngineer"
  assume_role_policy    = data.aws_iam_policy_document.assume_role_from_management.json
  max_session_duration  = var.role_max_session_duration
  force_detach_policies = var.role_force_detach_policies
}

#resource "aws_iam_role_policy_attachment" "apply_terraform" {
#  role       = aws_iam_role.infrastructure_engineer.name
#  policy_arn = aws_iam_policy.apply_terraform.arn
#}

resource "aws_iam_policy_attachment" "attach_administrator_access" {
  name       = "AdministratorAccess"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"  # ARN of the AdministratorAccess policy

  roles = [aws_iam_role.infrastructure_engineer.name]
}
