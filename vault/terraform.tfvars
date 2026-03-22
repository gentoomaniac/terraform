hosts = {
  "sto-dockerhost-a1" = {}
  "sto-dev-a1" = {}
  "sto-infra-a1" = {
    extra_policies = ["puppet-role-certbot"]
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