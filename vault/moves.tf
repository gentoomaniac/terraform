# ==========================================
# APPROLE MOVES
# ==========================================
moved {
  from = vault_approle_auth_backend_role.approle_sto_azerothcore_a1
  to   = vault_approle_auth_backend_role.approles["sto-azerothcore-a1"]
}
moved {
  from = vault_approle_auth_backend_role.approle_sto_dockerhost_a1
  to   = vault_approle_auth_backend_role.approles["sto-dockerhost-a1"]
}
moved {
  from = vault_approle_auth_backend_role.approle_sto_infra_a1
  to   = vault_approle_auth_backend_role.approles["sto-infra-a1"]
}
moved {
  from = vault_approle_auth_backend_role.approle_sto_jammya_a1
  to   = vault_approle_auth_backend_role.approles["sto-jammy-a1"]
}
moved {
  from = vault_approle_auth_backend_role.approle_sto_minecraft_a1
  to   = vault_approle_auth_backend_role.approles["sto-minecraft-a1"]
}
moved {
  from = vault_approle_auth_backend_role.approle_sto_minecraft_b1
  to   = vault_approle_auth_backend_role.approles["sto-minecraft-b1"]
}

# ==========================================
# FQDN POLICY MOVES
# ==========================================
moved {
  from = vault_policy.puppet_fqdn_sto_azerothcore_a1
  to   = vault_policy.puppet_fqdns["sto-azerothcore-a1"]
}
moved {
  from = vault_policy.puppet_fqdn_sto_coredns_a1
  to   = vault_policy.puppet_fqdns["sto-coredns-a1"]
}
moved {
  from = vault_policy.puppet_fqdn_sto_coredns_c1
  to   = vault_policy.puppet_fqdns["sto-coredns-c1"]
}
moved {
  from = vault_policy.puppet_fqdn_sto_dockerhost_a1
  to   = vault_policy.puppet_fqdns["sto-dockerhost-a1"]
}
moved {
  from = vault_policy.puppet_fqdn_sto_influxdb_a1
  to   = vault_policy.puppet_fqdns["sto-influxdb-a1"]
}
moved {
  from = vault_policy.puppet_fqdn_sto_infra_a1
  to   = vault_policy.puppet_fqdns["sto-infra-a1"]
}
moved {
  from = vault_policy.puppet_fqdn_sto_jammy_a1
  to   = vault_policy.puppet_fqdns["sto-jammy-a1"]
}
moved {
  from = vault_policy.puppet_fqdn_sto_minecraft_a1
  to   = vault_policy.puppet_fqdns["sto-minecraft-a1"]
}
moved {
  from = vault_policy.puppet_fqdn_sto_minecraft_b1
  to   = vault_policy.puppet_fqdns["sto-minecraft-b1"]
}
moved {
  from = vault_policy.puppet_fqdn_sto_nzbget_a1
  to   = vault_policy.puppet_fqdns["sto-nzbget-a1"]
}
moved {
  from = vault_policy.puppet_fqdn_sto_vault_a1
  to   = vault_policy.puppet_fqdns["sto-vault-a1"]
}

# ==========================================
# ROLE POLICY MOVES
# ==========================================
moved {
  from = vault_policy.puppet_role_azerothcore
  to   = vault_policy.puppet_roles["azerothcore"]
}
moved {
  from = vault_policy.puppet_role_coredns
  to   = vault_policy.puppet_roles["coredns"]
}
moved {
  from = vault_policy.puppet_role_dockerhost
  to   = vault_policy.puppet_roles["dockerhost"]
}
moved {
  from = vault_policy.puppet_role_influxdb
  to   = vault_policy.puppet_roles["influxdb"]
}
moved {
  from = vault_policy.puppet_role_infra
  to   = vault_policy.puppet_roles["infra"]
}
moved {
  from = vault_policy.puppet_role_minecraft
  to   = vault_policy.puppet_roles["minecraft"]
}
moved {
  from = vault_policy.puppet_role_nzbget
  to   = vault_policy.puppet_roles["nzbget"]
}
moved {
  from = vault_policy.puppet_role_vault
  to   = vault_policy.puppet_roles["vault"]
}