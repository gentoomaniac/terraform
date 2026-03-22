terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.0" # or your current version
    }
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.60.0" # Maps the name "proxmox" to the correct BPG provider
    }
  }
}

provider "vault" {
  address = "https://vault.srv.gentoomaniac.net"
}

provider "proxmox" {
  endpoint = "https://proxmox.srv.gentoomaniac.net:8006/"
  insecure = true
  # Remember to export PROXMOX_VE_API_TOKEN in your terminal!
}