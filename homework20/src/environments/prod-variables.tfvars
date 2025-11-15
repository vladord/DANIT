environment    = "prod"
vpc_cidr_block = "192.168.0.0/16"
subnets_cidr = {
  "public_a"  = "192.168.1.0/24"
  "public_b"  = "192.168.2.0/24"
  "private_a" = "192.168.10.0/24"
  "private_b" = "192.168.20.0/24"
}