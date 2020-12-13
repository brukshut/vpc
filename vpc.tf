resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "dedicated"
  enable_dns_hostnames = true

  tags = {
    Name        = var.name
    Project     = var.project    
    Environment = var.environment
    Terraform   = "Managed"
  }
}
