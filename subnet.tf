locals {
  public_cidr  = keys(var.public_subnets)
  private_cidr = keys(var.private_subnets)
}

resource "aws_subnet" "public" {
  for_each                = var.public_subnets
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.key
  availability_zone       = each.value
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.name}-public-${index(local.public_cidr, each.key)}"
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
    Name        = "${var.name}-private-${index(local.private_cidr, each.key)}"
    Project     = var.project    
    Environment = var.environment
    Terraform   = "Managed"
  }
}
