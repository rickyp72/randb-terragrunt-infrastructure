resource "aws_subnet" "private_subnet" {
  cidr_block = var.private-cidr-block
  vpc_id     = var.vpc_id
  map_public_ip_on_launch = false
    tags = {
    Name = "${var.resource_suffix}-private"
  }
}

resource "aws_subnet" "public_subnet" {
  cidr_block = var.public-cidr-block
  vpc_id     = var.vpc_id
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.resource_suffix}-public"
  }
}

