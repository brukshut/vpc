output "nat_gateway_id" {
  value = var.nat_gateway ? aws_nat_gateway.nat_gateway[0].id : null
}

output "internet_gateway_id" {
  value = var.internet_gateway ? aws_internet_gateway.gateway[0].id : null
}

output "private_route_table" {
  value = aws_route_table.private.id
}

output "public_route_table" {
  value = aws_route_table.public.id
}

output "private_subnets" {
  value = zipmap([for v in aws_subnet.private : v.id], [for v in aws_subnet.private : v.availability_zone])
}

output "public_subnets" {
  value = zipmap([for v in aws_subnet.public : v.id], [for v in aws_subnet.public : v.availability_zone])
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "zone_id" {
  value = var.enable_internal_dns ? aws_route53_zone.zone[0].id : null
}
