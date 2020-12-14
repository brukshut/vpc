variable "availability_zone" {
  description = "list of availability zones"
  type        = list(string)
}

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

variable "private_subnet_cidr" {
  description = "list of private subnet cidr blocks"
  type        = list(string)
}

variable "public_subnet_cidr" {
  description = "list of private subnet cidr blocks"
  type        = list(string)
}

variable "vpc_cidr" {}
