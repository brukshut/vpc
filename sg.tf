resource "aws_security_group" "proxy" {
  name        = "${var.name}-proxy"
  description = "allow incoming public ssh traffic and internal vpc traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name        = var.name
    Department  = var.department
    Environment = var.environment
    Customer    = var.customer
    Owner       = var.owner
    Project     = var.project
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "builder" {
  name        = "${var.name}-builder"
  description = "allow access from private vpc hosts"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name        = var.name
    Department  = var.department
    Environment = var.environment
    Customer    = var.customer
    Owner       = var.owner
    Project     = var.project
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
