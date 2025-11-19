resource "aws_instance" "frontend_1" {
  ami                         = data.aws_ami.ubuntu_ami.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_a.id
  key_name                    = var.key_pair
  user_data_replace_on_change = true
  vpc_security_group_ids      = [aws_security_group.frontend.id]
  iam_instance_profile        = aws_iam_instance_profile.frontend_profile.name
  tags                        = merge(local.common_tags, { "Name" = format(local.resourse_name, "frontend_1") })
}


resource "aws_instance" "frontend_2" {
  ami                         = data.aws_ami.ubuntu_ami.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_a.id
  key_name                    = var.key_pair
  user_data_replace_on_change = true
  vpc_security_group_ids      = [aws_security_group.frontend.id]
  iam_instance_profile        = aws_iam_instance_profile.frontend_profile.name
  tags                        = merge(local.common_tags, { "Name" = format(local.resourse_name, "frontend_2") })
}