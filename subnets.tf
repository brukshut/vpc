resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr[count.index]
  availability_zone       = var.availability_zone[count.index]
  count                   = length(var.public_subnet_cidr)
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.name}-${var.availability_zone[count.index]}"
    Project     = var.project    
    Environment = var.environment
    Terraform   = "Managed"
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet_cidr[count.index]
  availability_zone       = var.availability_zone[count.index]
  count                   = length(var.private_subnet_cidr)
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.name}-${var.availability_zone[count.index]}"
    Project     = var.project    
    Environment = var.environment
    Terraform   = "Managed"
  }
}
