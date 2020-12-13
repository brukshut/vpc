# vpc module

This module creates a basic AWS vpc with public and private subnets. It creates a public routing table with an optional internet gateway for the public subnets, and a private routing with an optional nat gateway for the private subnets.

# Example Usage
```
module "example_vpc" {
  source              = "github.com/brukshut/vpc?ref=0.1.0"
  name                = "example-simple-vpc"
  vpc_cidr            = "10.0.0.0/16"
  availability_zone   = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnet_cidr  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidr = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}
```
