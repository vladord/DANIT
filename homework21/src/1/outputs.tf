output "public_ip_1" {
  value       = aws_instance.frontend_1.public_ip
  description = "Public IP of the EC2 instance"
}
output "public_ip_2" {
  value       = aws_instance.frontend_2.public_ip
  description = "Public IP of the EC2 instance"
}

resource "local_file" "ansible_inventory_ini" {
  content = <<-EOT
    ${var.environment}
    [public]

    ${aws_instance.frontend_1.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=/home/${var.local_username}/.ssh/${var.key_pair}.pem
    ${aws_instance.frontend_2.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=/home/${var.local_username}/.ssh/${var.key_pair}.pem
  EOT 
    filename = "ansible/inventory.ini"
}
