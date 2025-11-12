environment    = "dev"
key_pair       = "ordynskyi-aws"
home_ip        = "94.45.133.90/32"
vpc_cidr_block = "10.0.0.0/16"
subnets_cidr = {
  "public_a"  = "10.0.1.0/24"
  "private_a" = "10.0.10.0/24"
}
