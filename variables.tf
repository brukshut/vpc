variable "instance_tenancy" {
  default = "default"
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "enable_internal_dns" {
  description = "create private route53 zone for vpc"
  type        = bool
  default     = false
}

variable "internal_zone_name" {
  description = "name of internal route53 zone"
  type        = string
  default     = null
}

variable "internet_gateway" {
  type    = bool
  default = true
}

variable "name" {}

variable "nat_gateway" {
  type    = bool
  default = true
}

variable "private_subnets" {
  description = "map of private subnet cidr blocks to availibility zones"
  type        = map(any)
}

variable "private_subnet_tags" {
  description = "additional private subnet tags"
  default     = null
  type        = map(string)
}

variable "public_subnets" {
  description = "map of public subnet cidr blocks to availibility zones"
  type        = map(string)
}

variable "public_subnet_tags" {
  description = "additional public subnet tags"
  default     = null
  type        = map(string)
}

variable "tags" {
  description = "standard set of tags"
  type        = map(string)
  default = {
    "Terraform" = "Managed"
  }
}

variable "vpc_cidr" {}

locals {
  tags = merge(var.tags, { "Name" = var.name, "Timestamp" = timestamp() })
}
