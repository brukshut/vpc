
output "private_subnets" {
  value = zipmap([for v in aws_subnet.private : v.id], [for v in aws_subnet.private : v.availability_zone])
}

output "public_subnets" {
  value = zipmap([for v in aws_subnet.public : v.id], [for v in aws_subnet.public : v.availability_zone])
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}
