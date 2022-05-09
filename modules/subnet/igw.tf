resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id
}

# create a route table for the IGW
resource "aws_route_table" "igw_route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name = "igw_route_table"
  }
}
# set the default route to the NAT Gateway
resource "aws_route" "int_route" {
  route_table_id         = aws_route_table.igw_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
}
# Associate the IGW route table with public subnet
resource "aws_route_table_association" "igw_rt_public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.igw_route_table.id
}