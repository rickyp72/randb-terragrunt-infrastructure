# nat gateway should be attached to the PUBLIC subnet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public_subnet.id
}
# give nat eip
resource "aws_eip" "nat_eip" {
  vpc = true
}
# create a route table for the nat gw
resource "aws_route_table" "nat_route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name = "nat-route-table"
  }
}
# set the default route to the NAT Gateway
resource "aws_route" "nat_route" {
  route_table_id         = aws_route_table.nat_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}
# Associate the NAT route table with private subnet
resource "aws_route_table_association" "nat-rt-private-association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.nat_route_table.id
}





