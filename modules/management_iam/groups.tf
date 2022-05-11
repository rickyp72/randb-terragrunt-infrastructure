### Infrastructure Engineer Group
resource "aws_iam_group" "infrastructure_engineers" {
  name = "infrastructure_engineers"
}

resource "aws_iam_policy" "assume_role_infrastructure_engineer" {
  name   = "assume_role_infrastructure_engineer"
  path   = "/"
  policy = data.aws_iam_policy_document.assume_role_infrastructure_engineer.json
}

resource "aws_iam_group_policy_attachment" "assume_role_infrastructure_engineer" {
  group      = aws_iam_group.infrastructure_engineers.name
  policy_arn = aws_iam_policy.assume_role_infrastructure_engineer.arn
}

data "aws_iam_policy_document" "assume_role_infrastructure_engineer" {

  statement {

    sid     = "AssumeRoleETSInfrastructureEngineer"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    resources = [
      "arn:aws:iam::${var.cross_account}:role/InfrastructureEngineer",
#      "arn:aws:iam::${local.preprod_account_number}:role/InfrastructureEngineer",
#      "arn:aws:iam::${local.prod_account_number}:role/InfrastructureEngineer",
    ]
  }
}


### Infrastructure Administrator Group
resource "aws_iam_policy" "assume_role_infrastructure_administrator" {
  name   = "assume_role_infrastructure_administator"
  path   = "/"
  policy = data.aws_iam_policy_document.assume_role_infrastructure_administrator.json
}

resource "aws_iam_group_policy_attachment" "assume_role_infrastructure_administrator" {
  group      = aws_iam_group.infrastructure_administrator.name
  policy_arn = aws_iam_policy.assume_role_infrastructure_administrator.arn
}

data "aws_iam_policy_document" "assume_role_infrastructure_administrator" {

  statement {

    sid     = "AssumeRoleInfrastructureAdministrator"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    resources = [
      "arn:aws:iam::${var.cross_account}:role/AWSCrossAccountAdministratorRole",
#      "arn:aws:iam::${local.preprod_account_number}:role/InfrastructureEngineer",
#      "arn:aws:iam::${local.prod_account_number}:role/InfrastructureEngineer",
    ]
  }
}

resource "aws_iam_group" "infrastructure_administrator" {
  name = "infrastructure_administrator"
}
