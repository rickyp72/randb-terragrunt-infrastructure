# Jumphost
module "jumphost" {
  source           = "../jumphost"
  subnet_id        = var.private_subnet_ids[0]
  sgs              = [aws_security_group.jumphost.id]
  resource_suffix  = var.resource_suffix
  ami_filter       = var.ami_filter
  instance_profile = var.create_instance_profile == true ? aws_iam_instance_profile.jumphost[0].id : null
}

# Jumphost
resource "aws_security_group" "jumphost" {
  name        = "jumphost-${var.resource_suffix}"
  description = "Jumphost"
  vpc_id      = var.vpc_id

  tags = {
    Env        = var.resource_suffix
    Managed_by = "Terraform"
  }
}

resource "aws_security_group_rule" "jumphost-egress" {
  security_group_id = aws_security_group.jumphost.id
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
