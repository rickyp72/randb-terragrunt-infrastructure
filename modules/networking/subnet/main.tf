resource "aws_subnet" "private_subnet" {
  cidr_block = var.private_cidr_block
  vpc_id     = var.vpc_id
  map_public_ip_on_launch = false
    tags = {
    Name = "${var.resource_suffix}_private"
  }
}

resource "aws_subnet" "public_subnet" {
  cidr_block = var.public_cidr_block
  vpc_id     = var.vpc_id
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.resource_suffix}_public"
  }
}

