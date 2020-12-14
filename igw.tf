resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "${var.name}"
    Project     = var.project    
    Environment = var.environment
    Terraform   = "Managed"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route" "gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gateway.id
}
