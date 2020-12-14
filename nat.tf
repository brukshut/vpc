// nat service requires a dedicated eip
resource "aws_eip" "eip" {
  count = var.nat_gateway ? 1 : 0
  vpc   = true

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = var.name
    Project     = var.project    
    Environment = var.environment
    Terraform   = "Managed"
  }
}

// nat_gateways are expensive, so allocate a single
// one to the first public subnet that we find
resource "aws_nat_gateway" "nat_gateway" {
  count         = var.nat_gateway ? 1 : 0
  allocation_id = aws_eip.eip[0].id
  subnet_id     = aws_subnet.public[0].id
 
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = var.name
    Project     = var.project    
    Environment = var.environment
    Terraform   = "Managed"
  }
}

resource "aws_route" "nat" {
  count                  = var.nat_gateway ? 1 : 0
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat_gateway[0].id
}
