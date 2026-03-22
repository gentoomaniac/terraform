resource "vault_github_user" "gentoomaniac" {
  user     = "gentoomaniac"
  policies = ["admin"]
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
  for_each = local.computed_hosts
  rule {
    path         = "puppet/data/fqdn/${each.key}.${var.domain}/*"
    capabilities = ["read"]
  }
}

resource "vault_policy" "puppet_fqdns" {
  for_each = local.computed_hosts
  name     = "${each.key}.${var.domain}"
  policy   = data.vault_policy_document.puppet_fqdns[each.key].hcl
}

# ==========================================
# DYNAMIC APPROLES
# ==========================================

resource "vault_approle_auth_backend_role" "approles" {
  for_each       = local.computed_hosts
  role_name      = "${each.key}.${var.domain}"

  # Concatenates puppet-common, any role-specific policies, the FQDN policy, and extra policies
  token_policies = concat(
    ["puppet-common"],
    [for role in each.value.roles : "puppet-role-${role}"],
    ["${each.key}.${var.domain}"],
    each.value.extra_policies
  )
}

# ==========================================
# GENERATE APPROLE SECRET IDs
# (Only for machines managed by Proxmox)
# ==========================================
resource "vault_approle_auth_backend_role_secret_id" "secrets" {
  for_each  = { for k, v in local.computed_hosts : k => v if v.proxmox != null }

  backend   = "approle"
  role_name = vault_approle_auth_backend_role.approles[each.key].role_name
}
