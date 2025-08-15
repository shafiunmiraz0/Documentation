resource "null_resource" "install_percona" {
  depends_on = [null_resource.vm_target]

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y gnupg2 curl lsb-release",
      "curl -fsSL https://repo.percona.com/apt/percona-release_latest.generic_all.deb -o percona-release.deb",
      "sudo dpkg -i percona-release.deb",
      "sudo percona-release setup ps80",
      "sudo apt update",
      "sudo apt install -y percona-server-server"
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
