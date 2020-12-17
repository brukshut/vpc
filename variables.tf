variable "instance_tenancy" {
  default = "default"
}

variable "enable_dns_hostnames" {
  type    = bool
  default = false
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "environment" {
  default = "gturn"
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

variable "project" {
  default = "gturn"
}

variable "private_subnets" {
  description = "map of private subnet cidr blocks to availibility zones"
  type        = map
}

variable "public_subnets" {
  description = "map of public subnet cidr blocks to availibility zones"
  type        = map
}

variable "vpc_cidr" {}
