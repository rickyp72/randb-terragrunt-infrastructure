resource "aws_instance" "jumphost" {
  ami                    = data.aws_ami.amazon.id
  instance_type          = var.instance_type
  iam_instance_profile   = var.instance_profile
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.sgs
  user_data              = "${file("${path.module}/jumphost.bash")}"
  disable_api_termination = false
  metadata_options {
    http_endpoint          = "enabled"
    http_tokens            = "required"
    instance_metadata_tags = "enabled"
  }

  tags = {
    Name = "Jumphost_${var.resource_suffix}"
  }
}

data "aws_ami" "amazon" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami-filter]
  }

  owners = ["amazon"]
}