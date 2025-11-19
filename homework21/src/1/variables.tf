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

variable "local_username" {
  type    = string
}

variable "ssm_access_policy_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
data "http" "myip" {
  url = "https://ifconfig.io"
}