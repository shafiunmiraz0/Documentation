resource "null_resource" "install_k0s" {
  depends_on = [null_resource.vm_target]

  provisioner "remote-exec" {
    inline = [
      "curl -sSLf https://get.k0s.sh | sudo sh",
      "sudo k0s install controller --single",
      "sudo k0s start"
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
