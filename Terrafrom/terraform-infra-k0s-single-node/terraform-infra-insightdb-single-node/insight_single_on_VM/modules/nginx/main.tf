resource "null_resource" "install_nginx" {
  provisioner "local-exec" {
    command = <<EOT
      sudo apt update
      sudo apt install -y nginx
      sudo systemctl enable nginx
      sudo systemctl start nginx
    EOT
  }
}
