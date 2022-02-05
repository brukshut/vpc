resource "aws_internet_gateway" "gateway" {
  count  = var.internet_gateway ? 1 : 0
  vpc_id = aws_vpc.vpc.id
  tags   = local.tags
}

resource "aws_route" "gateway" {
  count                  = var.internet_gateway ? 1 : 0
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gateway[0].id
}
