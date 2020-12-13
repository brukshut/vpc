resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.name}-${var.availability_zone[count.index]}"
    Project     = var.project    
    Environment = var.environment
    Terraform   = "Managed"
  }
}

resource "aws_route" "gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gateway.id
}
