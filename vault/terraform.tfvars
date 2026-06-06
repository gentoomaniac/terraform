hosts = {
  "sto-dockerhost-a1" = {}
  "sto-dev-a1" = {
    proxmox = {
      vm_id         = 102
      memory        = 8192
      on_boot       = true
      startup_order = 99
      cpu = {
        cores = 4
      }
    }
  }
  "sto-infra-a1" = {
    extra_policies = ["puppet-role-certbot"]
  }
  "sto-infra-b1" = {
    extra_policies = ["puppet-role-certbot"]
    proxmox = {
      vm_id         = 112
      memory        = 8192
      on_boot       = true
      startup_order = 1
      cpu = {
        cores = 2
        type  = "host"
      }
    }
  }
  "sto-coredns-a1" = {}
  "sto-coredns-c1" = {
    proxmox = {
      vm_id         = 109
      memory        = 4096
      on_boot       = true
      startup_order = 1
      cpu = {
        cores = 2
      }
    }
  }
  "sto-grafana-a1"  = {}
  "sto-nzbget-a1"   = {}
  "sto-windrose-a1" = {}
  "sto-vault-a1"    = {}
}
