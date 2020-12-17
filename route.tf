resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.name}-public"
    Project     = var.project    
    Environment = var.environment
    Terraform   = "Managed"
  }  
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.name}-private"
    Project     = var.project    
    Environment = var.environment
    Terraform   = "Managed"
  }  
}


resource "aws_route_table_association" "public" {
  count          = length([for v in aws_subnet.public : v.id])
  subnet_id      = element([for v in aws_subnet.public : v.id], count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length([for v in aws_subnet.private : v.id])
  subnet_id      = element([for v in aws_subnet.private : v.id], count.index)
  route_table_id = aws_route_table.private.id
}
