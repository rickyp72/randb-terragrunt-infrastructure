resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
}

#resource "aws_subnet" "private_subnet" {
#  cidr_block = "10.0.10.0/24"
#  vpc_id     = aws_vpc.vpc.id
#}