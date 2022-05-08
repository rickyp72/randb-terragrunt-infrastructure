resource "aws_subnet" "private_subnet" {
  cidr_block = "10.0.10.0/24"
  vpc_id     = var.vpc_id
  map_public_ip_on_launch = false
}

resource "aws_subnet" "public_subnet" {
  cidr_block = "10.0.50.0/24"
  vpc_id     = var.vpc_id
  map_public_ip_on_launch = true
}

