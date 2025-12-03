resource "aws_security_group" "frontend" {
  name        = format(local.resourse_name, "frontend_sg")
  description = "Sg for frontend"
  vpc_id      = aws_vpc.main.id

  tags = merge(local.common_tags, { "Name" = format(local.resourse_name, "frontend_sg") })

}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.frontend.id
  cidr_ipv4         = "${trim(data.http.myip.response_body, "\n")}/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.frontend.id
  cidr_ipv4         = "${trim(data.http.myip.response_body, "\n")}/32"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.frontend.id
  cidr_ipv4         = "${trim(data.http.myip.response_body, "\n")}/32"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.frontend.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_security_group" "database" {
  name        = format(local.resourse_name, "database_sg")
  description = "Sg for database"
  vpc_id      = aws_vpc.main.id

  tags = merge(local.common_tags, { "Name" = format(local.resourse_name, "database_sg") })

}

resource "aws_vpc_security_group_ingress_rule" "database_allow_all_traffic_ipv4" {
  security_group_id            = aws_security_group.database.id
  referenced_security_group_id = aws_security_group.frontend.id
  ip_protocol                  = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "database_allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.database.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}