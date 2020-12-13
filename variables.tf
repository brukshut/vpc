variable "availability_zone" {
  description = "list of availability zones"
  type        = list(string)
}

variable "environment" {
  default = "gturn"
}

variable "nat_gateway" {
  type    = bool
  default = true
}

variable "internet_gateway" {
  type    = bool
  default = true
}

variable "name" {}

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
