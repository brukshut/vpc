output "bastion_ip" {
  value = aws_instance.proxy.public_ip
}

output "proxy_ip" {
  value = aws_instance.proxy.private_ip
}

output "builder_ip" {
  value = aws_instance.builder.private_ip
}

output "private_subnets" {
  value = aws_subnet.private.*.id
}

output "public_subnets" {
  value = aws_subnet.public.*.id
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}
