provider "vault" {
  address = "https://vault.srv.gentoomaniac.net"
}

resource "vault_github_user" "gentoomaniac" {
  user     = "gentoomaniac"
  policies = ["admin"]
}

resource "vault_approle_auth_backend_role" "approle_sto_dockerhost_a1" {
  role_name      = "sto-dockerhost-a1.sto.gentoomaniac.net"
  token_policies = ["puppet-common", "puppet-role-dockerhost", "sto-dockerhost-a1.sto.gentoomaniac.net"]
}
resource "vault_approle_auth_backend_role" "approle_sto_infra_a1" {
  role_name      = "sto-infra-a1.sto.gentoomaniac.net"
  token_policies = ["puppet-common", "puppet-role-infra", "sto-infra-a1.sto.gentoomaniac.net", "puppet-role-certbot"]
}
resource "vault_approle_auth_backend_role" "approle_sto_minecraft_a1" {
  role_name      = "sto-minecraft-a1.sto.gentoomaniac.net"
  token_policies = ["puppet-common", "puppet-role-minecraft", "sto-minecraft-a1.sto.gentoomaniac.net"]
}
resource "vault_approle_auth_backend_role" "approle_bootstrap" {
  role_name      = "bootstrap"
  token_policies = ["puppet-common"]
}
resource "vault_approle_auth_backend_role" "approle_timo-demo" {
  role_name      = "timo-demo"
  token_policies = ["puppet-common"]
}
resource "vault_approle_auth_backend_role" "approle_sto_k8s_a1" {
  role_name      = "sto-k8s-a1.sto.gentoomaniac.net"
  token_policies = ["puppet-common", "puppet-role-k8s", "sto-k8s-a1.sto.gentoomaniac.net"]
}
resource "vault_approle_auth_backend_role" "approle_sto_k8s_a2" {
  role_name      = "sto-k8s-a2.sto.gentoomaniac.net"
  token_policies = ["puppet-common", "puppet-role-k8s", "sto-k8s-a2.sto.gentoomaniac.net"]
}
resource "vault_approle_auth_backend_role" "approle_sto_k8s_a3" {
  role_name      = "sto-k8s-a3.sto.gentoomaniac.net"
  token_policies = ["puppet-common", "puppet-role-k8s", "sto-k8s-a3.sto.gentoomaniac.net"]
}
resource "vault_approle_auth_backend_role" "approle_sto_k8s_a4" {
  role_name      = "sto-k8s-a4.sto.gentoomaniac.net"
  token_policies = ["puppet-common", "puppet-role-k8s", "sto-k8s-a4.sto.gentoomaniac.net"]
}
resource "vault_approle_auth_backend_role" "approle_sto_miner_a1" {
  role_name      = "sto-miner-a1.sto.gentoomaniac.net"
  token_policies = ["puppet-common", "puppet-role-miner", "sto-miner-a1.sto.gentoomaniac.net"]
}

data "vault_policy_document" "puppet_bootstrap" {
  rule {
    path         = "puppet/data/bootstrap/*"
    capabilities = ["read"]
    description  = "bootstrap area for new machines to pick up approle credentials"
  }
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
data "vault_policy_document" "puppet_role_minecraft" {
  rule {
    path         = "puppet/data/role/minecraft/*"
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
data "vault_policy_document" "puppet_role_k8s" {
  rule {
    path         = "puppet/data/role/k8s/*"
    capabilities = ["read"]
  }
}
data "vault_policy_document" "puppet_role_miner" {
  rule {
    path         = "puppet/data/role/miner/*"
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
data "vault_policy_document" "puppet_fqdn_sto_minecraft_a1" {
  rule {
    path         = "puppet/data/fqdn/sto-minecraft-a1.sto.gentoomaniac.net/*"
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
data "vault_policy_document" "puppet_fqdn_sto_k8s_a1" {
  rule {
    path         = "puppet/data/fqdn/sto-k8s-a1.sto.gentoomaniac.net/*"
    capabilities = ["read"]
  }
}
data "vault_policy_document" "puppet_fqdn_sto_k8s_a2" {
  rule {
    path         = "puppet/data/fqdn/sto-k8s-a2.sto.gentoomaniac.net/*"
    capabilities = ["read"]
  }
}
data "vault_policy_document" "puppet_fqdn_sto_k8s_a3" {
  rule {
    path         = "puppet/data/fqdn/sto-k8s-a3.sto.gentoomaniac.net/*"
    capabilities = ["read"]
  }
}
data "vault_policy_document" "puppet_fqdn_sto_k8s_a4" {
  rule {
    path         = "puppet/data/fqdn/sto-k8s-a4.sto.gentoomaniac.net/*"
    capabilities = ["read"]
  }
}
data "vault_policy_document" "puppet_fqdn_sto_miner_a1" {
  rule {
    path         = "puppet/data/fqdn/sto-miner-a1.sto.gentoomaniac.net/*"
    capabilities = ["read"]
  }
}

resource "vault_policy" "puppet_role_certbot" {
  name   = "puppet-role-certbot"
  policy = <<EOT
path "puppet/data/common/secret_srv_gentoomaniac_net_cert" {
  capabilities = ["read", "update"]
}
path "puppet/data/common/secret_srv_gentoomaniac_net_key" {
  capabilities = ["read", "update"]
}
path "puppet/data/role/certbot/*" {
  capabilities = ["read"]
}

EOT
}
resource "vault_policy" "puppet_bootstrap" {
  name   = "puppet-bootstrap"
  policy = data.vault_policy_document.puppet_bootstrap.hcl
}
resource "vault_policy" "puppet_role_coredns" {
  name   = "puppet-role-coredns"
  policy = data.vault_policy_document.puppet_role_coredns.hcl
}
resource "vault_policy" "puppet_role_dockerhost" {
  name   = "puppet-role-dockerhost"
  policy = data.vault_policy_document.puppet_role_dockerhost.hcl
}
resource "vault_policy" "puppet_role_influxdb" {
  name   = "puppet-role-influxdb"
  policy = data.vault_policy_document.puppet_role_influxdb.hcl
}
resource "vault_policy" "puppet_role_infra" {
  name   = "puppet-role-infra"
  policy = data.vault_policy_document.puppet_role_infra.hcl
}
resource "vault_policy" "puppet_role_minecraft" {
  name   = "puppet-role-minecraft"
  policy = data.vault_policy_document.puppet_role_minecraft.hcl
}
resource "vault_policy" "puppet_role_nzbget" {
  name   = "puppet-role-nzbget"
  policy = data.vault_policy_document.puppet_role_nzbget.hcl
}
resource "vault_policy" "puppet_role_vault" {
  name   = "puppet-role-vault"
  policy = data.vault_policy_document.puppet_role_vault.hcl
}
resource "vault_policy" "puppet_role_k8s" {
  name   = "puppet-role-k8s"
  policy = data.vault_policy_document.puppet_role_k8s.hcl
}
resource "vault_policy" "puppet_role_miner" {
  name   = "puppet-role-miner"
  policy = data.vault_policy_document.puppet_role_miner.hcl
}

resource "vault_policy" "puppet_fqdn_sto_coredns_a1" {
  name   = "sto-coredns-a1.sto.gentoomaniac.net"
  policy = data.vault_policy_document.puppet_fqdn_sto_coredns_a1.hcl
}
resource "vault_policy" "puppet_fqdn_sto_coredns_c1" {
  name   = "sto-coredns-c1.sto.gentoomaniac.net"
  policy = data.vault_policy_document.puppet_fqdn_sto_coredns_c1.hcl
}
resource "vault_policy" "puppet_fqdn_sto_dockerhost_a1" {
  name   = "sto-dockerhost-a1.sto.gentoomaniac.net"
  policy = data.vault_policy_document.puppet_fqdn_sto_dockerhost_a1.hcl
}
resource "vault_policy" "puppet_fqdn_sto_influxdb_a1" {
  name   = "sto-influxdb-a1.sto.gentoomaniac.net"
  policy = data.vault_policy_document.puppet_fqdn_sto_influxdb_a1.hcl
}
resource "vault_policy" "puppet_fqdn_sto_infra_a1" {
  name   = "sto-infra-a1.sto.gentoomaniac.net"
  policy = data.vault_policy_document.puppet_fqdn_sto_infra_a1.hcl
}
resource "vault_policy" "puppet_fqdn_sto_minecraft_a1" {
  name   = "sto-minecraft-a1.sto.gentoomaniac.net"
  policy = data.vault_policy_document.puppet_fqdn_sto_minecraft_a1.hcl
}
resource "vault_policy" "puppet_fqdn_sto_nzbget_a1" {
  name   = "sto-nzbget-a1.sto.gentoomaniac.net"
  policy = data.vault_policy_document.puppet_fqdn_sto_nzbget_a1.hcl
}
resource "vault_policy" "puppet_fqdn_sto_vault_a1" {
  name   = "sto-vault-a1.sto.gentoomaniac.net"
  policy = data.vault_policy_document.puppet_fqdn_sto_vault_a1.hcl
}
resource "vault_policy" "puppet_fqdn_sto_k8s_a1" {
  name   = "sto-k8s-a1.sto.gentoomaniac.net"
  policy = data.vault_policy_document.puppet_fqdn_sto_k8s_a1.hcl
}
resource "vault_policy" "puppet_fqdn_sto_k8s_a2" {
  name   = "sto-k8s-a2.sto.gentoomaniac.net"
  policy = data.vault_policy_document.puppet_fqdn_sto_k8s_a2.hcl
}
resource "vault_policy" "puppet_fqdn_sto_k8s_a3" {
  name   = "sto-k8s-a3.sto.gentoomaniac.net"
  policy = data.vault_policy_document.puppet_fqdn_sto_k8s_a3.hcl
}
resource "vault_policy" "puppet_fqdn_sto_k8s_a4" {
  name   = "sto-k8s-a4.sto.gentoomaniac.net"
  policy = data.vault_policy_document.puppet_fqdn_sto_k8s_a4.hcl
}
resource "vault_policy" "puppet_fqdn_sto_miner_a1" {
  name   = "sto-miner-a1.sto.gentoomaniac.net"
  policy = data.vault_policy_document.puppet_fqdn_sto_miner_a1.hcl
}
