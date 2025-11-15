resource "aws_security_group" "nginx" {
  name        = format(local.resourse_name, "nginx_sg")
  description = "Sg for nginx"
  vpc_id      = aws_vpc.main.id

  tags = merge(local.common_tags, { "Name" = format(local.resourse_name, "nginx_sg") })

}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.nginx.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  for_each = var.list_of_open_ports
  security_group_id = aws_security_group.nginx.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = each.value
  ip_protocol       = "tcp"
  to_port           = each.value
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.nginx.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}