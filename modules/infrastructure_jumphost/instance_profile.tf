resource "aws_iam_role" "jumpbox_instance_role" {
    count               = var.create_instance_profile == true ? 1 : 0
    description         = "Jumpbox instance role"
    name                = "Jumbox-instance-role-${var.resource_suffix}"
    assume_role_policy  = data.aws_iam_policy_document.jumphost_assume_role.json
}

resource "aws_iam_role_policy_attachment" "AmazonSSMManagedInstanceCore" {
    count      = var.create_instance_profile == true ? 1 : 0
    role       = aws_iam_role.jumpbox_instance_role[0].name
    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "jumphost" {
    count   = var.create_instance_profile == true ? 1 : 0
    name    = "jumphost_instance_profle"
    role    = aws_iam_role.jumpbox_instance_role[0].name
}

data "aws_iam_policy_document" "jumphost_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}