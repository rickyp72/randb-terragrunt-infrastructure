output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "default_vpc_sg" {
  value = aws_vpc.vpc.default_security_group_id
}

output "vpc_cidr_block" {
  value = aws_vpc.vpc.cidr_block
}
