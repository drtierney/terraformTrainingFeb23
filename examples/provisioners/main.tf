resource "null_resource" "timestamp" {

  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command     = "'${timestamp()}' | Out-File timestamp.log -append"
    interpreter = ["PowerShell", "-Command"]
  }
}

resource "aws_instance" "vm" {
  ami                    = "ami-06d94a781b544c133"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-1ed6d663", "sg-0e1060e8033b2d553"]
  key_name               = var.key_name
  tags = {
    Name = "dt-web"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y && sudo apt upgrade -y",
      "sudo apt -y install mini-httpd && sudo systemctl start mini-httpd",
      "echo '<h1>This is a test server</h1>' > index.html",
      "sudo mv index.html /var/www/html/"
    ]
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("${var.key_name}.pem")
    timeout     = "10m"
  }
}

output "vm_ip" {
  value = aws_instance.vm.public_ip
}
