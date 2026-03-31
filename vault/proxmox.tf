resource "proxmox_virtual_environment_vm" "vault_smbios" {
  for_each = { for hostname, config in local.computed_hosts : hostname => config if config.proxmox != null }

  node_name = var.pve_node
  name      = each.key
  vm_id     = each.value.proxmox.vm_id

  # Start on boot
  on_boot = each.value.proxmox.on_boot

  # Boot Priority / Startup Order
  startup {
    order = each.value.proxmox.startup_order
  }

  # CPU Cores
  cpu {
    cores = each.value.proxmox.cpu.cores
    type  = each.value.proxmox.cpu.type
  }

  # Memory (in Megabytes)
  memory {
    dedicated = each.value.proxmox.memory
  }

  # Inject the AppRole credentials
  smbios {
    serial  = vault_approle_auth_backend_role.approles[each.key].role_id
    version = vault_approle_auth_backend_role_secret_id.secrets[each.key].secret_id
  }

  # ==========================================
  # THE BULLETPROOF SHIELD
  # ==========================================
  lifecycle {
    # 1. ABSOLUTELY NEVER delete this VM, even if removed from the code
    prevent_destroy = true

    # 2. Never touch the disks, network, OS, or other sensitive settings
    ignore_changes = [
      disk, network_device, operating_system, initialization, vga, clone, description, tags
    ]
  }

}
