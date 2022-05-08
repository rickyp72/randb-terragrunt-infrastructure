output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}
### output subnet as list
output "private_subnets" {
  value = aws_subnet.private_subnet.*.id
}