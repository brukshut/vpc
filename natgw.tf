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

resource "aws_nat_gateway" "nat_gateway" {
  count         = var.nat_gateway ? 1 : 0
  allocation_id = "${aws_eip.eip.id}"
  subnet_id     = "${var.subnet_id}"
 
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
