output "master_public_ip" {
  value       = aws_instance.frontend.public_ip
  description = "Public IP of the EC2 instance"
}

output "runner_private_ip" {
  value       = aws_instance.database.private_ip
  description = "Private IP of Jenkins runner"
}

resource "local_file" "inventory_ini" {
    content  = "[petclinic]\n${aws_instance.frontend.public_ip}"
    filename = "./ansible/inventory.ini"
}
