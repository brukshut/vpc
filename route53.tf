// create internal route53 zone
resource "aws_route53_zone" "zone" {
  count = var.enable_internal_dns ? 1 : 0
  name  = var.internal_zone_name

  vpc {
    vpc_id = aws_vpc.vpc.id
  }

  tags = {
    Name        = var.internal_zone_name
    Project     = var.project    
    Environment = var.environment
    Terraform   = "Managed"
  }
}

