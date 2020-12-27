provider "vault" {
  address = "https://vault.srv.gentoomaniac.net"
}

data "vault_policy_document" "puppet_common" {
  rule {
    path         = "puppet/data/common/*"
    capabilities = ["read"]
    description  = "common secrets for all machines managed by puppet"
  }
}

data "vault_policy_document" "puppet_role_coredns" {
  rule {
    path         = "puppet/data/role/coredns/*"
    capabilities = ["read"]
  }
}
data "vault_policy_document" "puppet_role_dockerhost" {
  rule {
    path         = "puppet/data/role/dockerhost/*"
    capabilities = ["read"]
  }
}
data "vault_policy_document" "puppet_role_influxdb" {
  rule {
    path         = "puppet/data/role/influxdb/*"
    capabilities = ["read"]
  }
}
data "vault_policy_document" "puppet_role_infra" {
  rule {
    path         = "puppet/data/role/infra/*"
    capabilities = ["read"]
  }
}
data "vault_policy_document" "puppet_role_nzbget" {
  rule {
    path         = "puppet/data/role/nzbget/*"
    capabilities = ["read"]
  }
}
data "vault_policy_document" "puppet_role_vault" {
  rule {
    path         = "puppet/data/role/vault/*"
    capabilities = ["read"]
  }
}

data "vault_policy_document" "puppet_fqdn_sto_coredns_a1" {
  rule {
    path         = "puppet/data/fqdn/sto-coredns-a1.sto.gentoomaniac.net/*"
    capabilities = ["read"]
  }
}
data "vault_policy_document" "puppet_fqdn_sto_coredns_c1" {
  rule {
    path         = "puppet/data/fqdn/sto-coredns-c1.sto.gentoomaniac.net/*"
    capabilities = ["read"]
  }
}
data "vault_policy_document" "puppet_fqdn_sto_dockerhost_a1" {
  rule {
    path         = "puppet/data/fqdn/sto-dockerhost-a1.sto.gentoomaniac.net/*"
    capabilities = ["read"]
  }
}
data "vault_policy_document" "puppet_fqdn_sto_influxdb_a1" {
  rule {
    path         = "puppet/data/fqdn/sto-influxdb-a1.sto.gentoomaniac.net/*"
    capabilities = ["read"]
  }
}
data "vault_policy_document" "puppet_fqdn_sto_infra_a1" {
  rule {
    path         = "puppet/data/fqdn/sto-infra-a1.sto.gentoomaniac.net/*"
    capabilities = ["read"]
  }
}
data "vault_policy_document" "puppet_fqdn_sto_nzbget_a1" {
  rule {
    path         = "puppet/data/fqdn/sto-nzbget-a1.sto.gentoomaniac.net/*"
    capabilities = ["read"]
  }
}
data "vault_policy_document" "puppet_fqdn_sto_vault_a1" {
  rule {
    path         = "puppet/data/fqdn/sto-vault-a1.sto.gentoomaniac.net/*"
    capabilities = ["read"]
  }
}

resource "vault_policy" "puppet_role_coredns" {
  name     = "puppet-role-coredns"
  policy   = data.vault_policy_document.puppet_role_coredns.hcl
}
resource "vault_policy" "puppet_role_dockerhost" {
  name     = "puppet-role-dockerhost"
  policy   = data.vault_policy_document.puppet_role_dockerhost.hcl
}
resource "vault_policy" "puppet_role_influxdb" {
  name     = "puppet-role-influxdb"
  policy   = data.vault_policy_document.puppet_role_influxdb.hcl
}
resource "vault_policy" "puppet_role_infra" {
  name     = "puppet-role-infra"
  policy   = data.vault_policy_document.puppet_role_infra.hcl
}
resource "vault_policy" "puppet_role_nzbget" {
  name     = "puppet-role-nzbget"
  policy   = data.vault_policy_document.puppet_role_nzbget.hcl
}
resource "vault_policy" "puppet_role_vault" {
  name     = "puppet-role-vault"
  policy   = data.vault_policy_document.puppet_role_vault.hcl
}

resource "vault_policy" "puppet_fqdn_sto_coredns_a1" {
  name     = "sto-coredns-a1.sto.gentoomaniac.net"
  policy   = data.vault_policy_document.puppet_fqdn_sto_coredns_a1.hcl
}
resource "vault_policy" "puppet_fqdn_sto_coredns_c1" {
  name     = "sto-coredns-c1.sto.gentoomaniac.net"
  policy   = data.vault_policy_document.puppet_fqdn_sto_coredns_c1.hcl
}
resource "vault_policy" "puppet_fqdn_sto_dockerhost_a1" {
  name     = "sto-dockerhost-a1.sto.gentoomaniac.net"
  policy   = data.vault_policy_document.puppet_fqdn_sto_dockerhost_a1.hcl
}
resource "vault_policy" "puppet_fqdn_sto_influxdb_a1" {
  name     = "sto-influxdb-a1.sto.gentoomaniac.net"
  policy   = data.vault_policy_document.puppet_fqdn_sto_influxdb_a1.hcl
}
resource "vault_policy" "puppet_fqdn_sto_infra_a1" {
  name     = "sto-infra-a1.sto.gentoomaniac.net"
  policy   = data.vault_policy_document.puppet_fqdn_sto_infra_a1.hcl
}
resource "vault_policy" "puppet_fqdn_sto_nzbget_a1" {
  name     = "sto-nzbget-a1.sto.gentoomaniac.net"
  policy   = data.vault_policy_document.puppet_fqdn_sto_nzbget_a1.hcl
}
resource "vault_policy" "puppet_fqdn_sto_vault_a1" {
  name     = "sto-vault-a1.sto.gentoomaniac.net"
  policy   = data.vault_policy_document.puppet_fqdn_sto_vault_a1.hcl
}
