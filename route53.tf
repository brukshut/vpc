// create internal route53 zone
resource "aws_route53_zone" "zone" {
  count = var.enable_internal_dns ? 1 : 0
  name  = var.internal_zone_name
  tags  = local.tags

  vpc {
    vpc_id = aws_vpc.vpc.id
  }
}

