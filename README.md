# vpc module

This module creates a basic AWS VPC with public and private subnets. It creates a public routing table with an optional internet gateway for the public subnets, and a private routing with an optional nat gateway for the private subnets. If DNS is enabled, you can also specify an optional private domain name.

# Example Usage
```
module "gturn_vpc" {
  source            = "github.com/brukshut/vpc?ref=0.0.5"
  private_subnets      = {
    "10.0.11.0/24" = "us-west-1b"
    "10.0.13.0/24" = "us-west-1a"
    "10.0.15.0/24" = "us-west-1b"
   }
  public_subnets       = {
    "10.0.10.0/24" = "us-west-1a"
    "10.0.12.0/24" = "us-west-1b"
    "10.0.14.0/24" = "us-west-1a"
  }
  vpc_cidr             = "10.0.0.0/16"
  name                 = "foobar-vpc"
  enable_dns_hostnames = true
  enable_internal_dns  = true
  internal_zone_name   = "foobar.nt"
  nat_gateway          = false
  internet_gateway     = true
}
```
