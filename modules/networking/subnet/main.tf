resource "aws_subnet" "private_subnet" {
  cidr_block = "10.0.10.0/24"
  vpc_id     = var.vpc_id
}