provider "null" {}

resource "null_resource" "vm_target" {
  connection {
    type        = "ssh"
    host        = var.vm_ip
    user        = var.vm_user
    private_key = file(var.private_key_path)
  }

  # This dummy trigger ensures ordering
  triggers = {
    always_run = timestamp()
  }
}
