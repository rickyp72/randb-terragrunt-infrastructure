

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public_subnet.id
}



resource "aws_eip" "nat_eip" {
  vpc = true
}

# Setup Multi AZ Nat Gateway
resource "aws_route_table_association" "private-nat-rt-association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.nat_route_table.id
}

resource "aws_route_table" "nat_route_table" {
  vpc_id = var.vpc_id
}

resource "aws_route" "nat_route" {
  route_table_id         = aws_route_table.nat_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

