# Import the existing HCPUSER role (using new resource type)
resource "snowflake_role" "hcpuser" {
  name    = "HCPUSER"
  comment = "HCP User role - ownership transferred to SYSADMIN"
}

# Grant ownership of HCPUSER role to SYSADMIN
resource "snowflake_role_ownership_grant" "role_ownership_transfer" {
  on_role_name = snowflake_role.hcpuser.name  # The role to change ownership of
  to_role_name = "SYSADMIN"                   # The role to transfer ownership to
  depends_on = [snowflake_role.hcpuser]
}
