hosts = {
  "sto-dockerhost-a1" = {}
  "sto-dev-a1" = {
    proxmox = {
      vm_id          = 102
      cores          = 4
      memory         = 8192
      on_boot        = true
      startup_order  = 99
    }
  }
  "sto-infra-a1" = {
    extra_policies = ["puppet-role-certbot"]
  }
  "sto-infra-b1"   = {
    extra_policies = ["puppet-role-certbot"]
    proxmox = {
      vm_id         = 112
      cores         = 2
      memory        = 4096
      on_boot       = true
      startup_order = 1
    }
  }
  "sto-coredns-a1"   = {}
  "sto-coredns-c1"   = {
    proxmox = {
      vm_id         = 109
      cores         = 2
      memory        = 4096
      on_boot       = true
      startup_order = 1
    }
  }
  "sto-grafana-a1"  = {}
  "sto-nzbget-a1"    = {}
  "sto-vault-a1"     = {}
}