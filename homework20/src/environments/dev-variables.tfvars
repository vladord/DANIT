environment    = "dev"
vpc_cidr_block = "10.0.0.0/16"
subnets_cidr = {
  "public_a"  = "10.0.1.0/24"
  "public_b"  = "10.0.2.0/24"
  "private_a" = "10.0.10.0/24"
  "private_b" = "10.0.20.0/24"
}