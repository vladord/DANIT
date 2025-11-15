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

variable "vpc_cidr_block" {
  type = string
}

variable "subnets_cidr" {
  type = any
}

variable "ssm_access_policy_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

variable "vpc_id" {
  type = any
  description = "Must be provided only from CLI"
}

variable "list_of_open_ports" {
  type = map(number)
  description = "Must be provided only from CLI"
}