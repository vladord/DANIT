resource "aws_instance" "nginx" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_a.id
  user_data = templatefile("./templates/user-data.sh", {
    environment = var.environment
  })
  user_data_replace_on_change = true
  vpc_security_group_ids      = [aws_security_group.nginx.id]
  iam_instance_profile        = aws_iam_instance_profile.nginx_instance_profile.name
  tags                        = merge(local.common_tags, { "Name" = format(local.resourse_name, "nginx") })
}

