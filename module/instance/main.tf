resource "aws_instance" "revving" {
  ami           =  var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.security_group]
  key_name = var.key

  tags = {
    Name = "dev"
    Environment = "${var.environment}"
  }

  provisioner "remote-exec" {
    inline = ["echo 'Wait, Until SSH is Ready'"]
    connection {
      type = "ssh"
      user = var.ssh_user
      private_key = file(var.private_key_path)
      host = aws_instance.revving.public_ip
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${aws_instance.revving.public_ip}, --private-key ${var.private_key_path} setup.yml"
  }
}

output "aws_ip" {
  value = aws_instance.revving.public_ip
}