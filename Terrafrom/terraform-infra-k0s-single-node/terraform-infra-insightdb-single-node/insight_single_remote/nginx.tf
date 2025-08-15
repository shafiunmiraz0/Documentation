resource "null_resource" "install_nginx" {
  depends_on = [null_resource.vm_target]

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y nginx"
    ]

    connection {
    type     = "ssh"
    host     = var.vm_ip
    user     = var.vm_user
    password = var.vm_password

    timeout     = "2m"
    script_path = "/tmp/terraform_provision.sh"
    }

  }
}
