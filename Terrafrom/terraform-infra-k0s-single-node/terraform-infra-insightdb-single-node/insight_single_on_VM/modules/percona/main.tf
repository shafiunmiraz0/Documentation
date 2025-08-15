resource "null_resource" "install_percona" {
  provisioner "local-exec" {
    command = <<EOT
      sudo apt update
      sudo apt install -y gnupg2 curl lsb-release
      curl -fsSL https://repo.percona.com/apt/percona-release_latest.generic_all.deb -o percona-release.deb
      sudo dpkg -i percona-release.deb
      sudo percona-release setup ps80
      sudo apt update
      sudo DEBIAN_FRONTEND=noninteractive apt install -y percona-server-server
      sudo systemctl enable mysql
      sudo systemctl start mysql
    EOT
  }
}
