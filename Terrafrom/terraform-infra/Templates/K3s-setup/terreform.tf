provider "proxmox" {
  pm_api_url      = "https://your-proxmox-server:8006/api2/json"
  pm_user         = "root@pam"
  pm_password     = "your-password"
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "k3s_master" {
  name        = "k3s-master"
  target_node = "proxmox-node"
  vmid        = 100
  clone       = "ubuntu-template"  # Change to your template name
  
  cores   = 2
  memory  = 4096
  sockets = 1
  
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  disk {
    type    = "scsi"
    size    = "20G"
    storage = "local-lvm"
  }

  provisioner "remote-exec" {
    inline = [
      "curl -sfL https://get.k3s.io | sh -"
    ]
  }
}

output "master_ip" {
  value = proxmox_vm_qemu.k3s_master.default_ipv4_address
}
