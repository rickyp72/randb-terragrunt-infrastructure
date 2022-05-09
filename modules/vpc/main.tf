resource "aws_vpc" "vpc" {
  cidr_block = var.cidr-block
  tags = {
    Name = "${var.resource_suffix}-vpc"
  }
}
