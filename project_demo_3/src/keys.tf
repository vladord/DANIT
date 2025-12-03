resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

/*
resource "aws_key_pair" "generated_key" {
  key_name   = "my-terraform-ssh-key"
  public_key = tls_private_key.ssh.public_key_openssh
}

# (Optional) Save the private key locally for easy access
resource "local_sensitive_file" "pem_file" {
  filename        = pathexpand("./ssh/${aws_key_pair.generated_key.key_name}.pem")
  file_permission = "600"
  content         = tls_private_key.ssh.private_key_pem
}

resource "local_sensitive_file" "pub_file" {
  filename        = pathexpand("./ssh/${aws_key_pair.generated_key.key_name}.pub")
  file_permission = "600"
  content         = tls_private_key.ssh.public_key_openssh
}
*/
