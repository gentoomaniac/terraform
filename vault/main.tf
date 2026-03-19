provider "vault" {
  address = "https://vault.srv.gentoomaniac.net"
}

resource "vault_github_user" "gentoomaniac" {
  user     = "gentoomaniac"
  policies = ["admin"]
}

locals {
  domain = "sto.gentoomaniac.net"

  # --------------------------------------------------------
  # HOST DICTIONARY
  # Add new hosts here. All hosts will automatically get an AppRole.
  # - roles: Maps to puppet/data/role/<role>/*
  # - extra_policies: Any additional policies (e.g., certbot)
  # --------------------------------------------------------
  hosts = {
    "sto-coredns-a1" = {
      roles          = ["coredns"]
      extra_policies = []
    }
    "sto-coredns-c1" = {
      roles          = ["coredns"]
      extra_policies = []
    }
    "sto-dev-a1" = {
      roles          = ["dev"]
      extra_policies = []
    }
    "sto-dockerhost-a1" = {
      roles          = ["dockerhost"]
      extra_policies = []
    }
    "sto-infra-a1" = {
      roles          = ["infra"]
      extra_policies = ["puppet-role-certbot"]
    }
    "sto-nzbget-a1" = {
      roles          = ["nzbget"]
      extra_policies = []
    }
    "sto-vault-a1" = {
      roles          = ["vault"]
      extra_policies = []
    }
  }

  # Dynamically extract all unique roles from the hosts dictionary
  # plus any standalone roles you want to ensure are created.
  roles = toset([
    "coredns", "dev", "dockerhost", "infra", "minecraft", "nzbget", "vault"
  ])
}

# ==========================================
# BOOTSTRAP & COMMON RESOURCES
# ==========================================

resource "vault_approle_auth_backend_role" "approle_bootstrap" {
  role_name      = "bootstrap"
  token_policies = ["puppet-common"]
}

data "vault_policy_document" "puppet_bootstrap" {
  rule {
    path         = "puppet/data/bootstrap/*"
    capabilities = ["read"]
    description  = "bootstrap area for new machines to pick up approle credentials"
  }
}

resource "vault_policy" "puppet_bootstrap" {
  name   = "puppet-bootstrap"
  policy = data.vault_policy_document.puppet_bootstrap.hcl
}

data "vault_policy_document" "puppet_common" {
  rule {
    path         = "puppet/data/common/*"
    capabilities = ["read"]
    description  = "common secrets for all machines managed by puppet"
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

# ==========================================
# DYNAMIC ROLE POLICIES
# ==========================================

data "vault_policy_document" "puppet_roles" {
  for_each = local.roles
  rule {
    path         = "puppet/data/role/${each.key}/*"
    capabilities = ["read"]
  }
}

resource "vault_policy" "puppet_roles" {
  for_each = local.roles
  name     = "puppet-role-${each.key}"
  policy   = data.vault_policy_document.puppet_roles[each.key].hcl
}

# ==========================================
# DYNAMIC FQDN POLICIES
# ==========================================

data "vault_policy_document" "puppet_fqdns" {
  for_each = local.hosts
  rule {
    path         = "puppet/data/fqdn/${each.key}.${local.domain}/*"
    capabilities = ["read"]
  }
}

resource "vault_policy" "puppet_fqdns" {
  for_each = local.hosts
  name     = "${each.key}.${local.domain}"
  policy   = data.vault_policy_document.puppet_fqdns[each.key].hcl
}

# ==========================================
# DYNAMIC APPROLES
# ==========================================

resource "vault_approle_auth_backend_role" "approles" {
  for_each       = local.hosts
  role_name      = "${each.key}.${local.domain}"
  
  # Concatenates puppet-common, any role-specific policies, the FQDN policy, and extra policies
  token_policies = concat(
    ["puppet-common"],
    [for role in each.value.roles : "puppet-role-${role}"],
    ["${each.key}.${local.domain}"],
    each.value.extra_policies
  )
}