resource "aws_subnet" "public" {
  for_each                = var.public_subnets
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.key
  availability_zone       = each.value
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.name}-public-${each.value}"
    Project     = var.project    
    Environment = var.environment
    Terraform   = "Managed"
  }
}

resource "aws_subnet" "private" {
  for_each                = var.private_subnets
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.key
  availability_zone       = each.value
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.name}-private-${each.value}"
    Project     = var.project    
    Environment = var.environment
    Terraform   = "Managed"
  }
}
