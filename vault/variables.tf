variable "domain" {
  description = "The base domain for the hosts"
  type        = string
  default     = "sto.gentoomaniac.net"
}

variable "pve_node" {
  description = "The default Proxmox node"
  type        = string
  default     = "sto-proxmox-a1"
}

variable "hosts" {
  description = "Map of all hosts and their configurations"
  type = map(object({
    roles          = optional(list(string))
    extra_policies = optional(list(string), [])
    proxmox = optional(object({
      vm_id         = number
      cores         = number
      memory        = number
      on_boot       = bool
      startup_order = number
    }))
  }))
}

locals {
  computed_hosts = {
    for hostname, config in var.hosts : hostname => {
      # If roles is null (omitted), calculate it: sto-role-a1 -> role
      # If roles is explicitly provided (even as []), use the override
      roles          = config.roles != null ? config.roles : [split("-", hostname)[1]]
      extra_policies = config.extra_policies
      proxmox        = config.proxmox
    }
  }

  roles = toset(flatten([for k, v in local.computed_hosts : v.roles]))
}