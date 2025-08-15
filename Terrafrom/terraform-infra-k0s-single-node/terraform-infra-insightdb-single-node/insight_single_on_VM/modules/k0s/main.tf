resource "null_resource" "install_k0s" {
  provisioner "local-exec" {
    command = <<EOT
      curl -sSLf https://get.k0s.sh | sudo sh
      sudo k0s install controller --single
      sudo k0s start
    EOT
  }
}
