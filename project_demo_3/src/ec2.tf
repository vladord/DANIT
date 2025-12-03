resource "aws_instance" "frontend" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_a.id
  key_name      = var.key_pair
  user_data = templatefile("./templates/frontend-user-data.sh", {
    environment = var.environment
    vpc_id      = aws_vpc.main.id
    private_ssh_key = tls_private_key.ssh.private_key_pem
  })
  user_data_replace_on_change = true
  vpc_security_group_ids      = [aws_security_group.frontend.id]
  iam_instance_profile        = aws_iam_instance_profile.frontend_profile.name
  tags                        = merge(local.common_tags, { "Name" = format(local.resourse_name, "frontend") })
}


resource "aws_instance" "database" {
  ami           = data.aws_ami.ubuntu_ami.id

  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_a.id
  key_name      = var.key_pair
  user_data = templatefile("./templates/database-user-data.sh", {
    environment = var.environment
    vpc_id      = aws_vpc.main.id
    public_ssh_key = tls_private_key.ssh.public_key_openssh
  })
  user_data_replace_on_change = true
  vpc_security_group_ids      = [aws_security_group.database.id]
  iam_instance_profile        = aws_iam_instance_profile.database_profile.name
  tags                        = merge(local.common_tags, { "Name" = format(local.resourse_name, "database") })

  instance_market_options {
    market_type = "spot"
    spot_options {
      instance_interruption_behavior = "stop"
      spot_instance_type             = "persistent"
    }
  }
}
