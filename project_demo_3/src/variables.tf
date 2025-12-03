variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "environment" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_pair" {
  type = string
}
variable "vpc_cidr_block" {
  type = string
}

variable "subnets_cidr" {
  type = any
}

variable "ssm_access_policy_arn" {
  type = string
  default = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  #default = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

data "http" "myip" {
  url = "https://icanhazip.com"
}

