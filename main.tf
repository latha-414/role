# Import the existing HCPUSER role (using new resource type)
resource "snowflake_account_role" "hcpuser" {
  name    = "HCPUSER"
  comment = "HCP User role - ownership transferred to SYSADMIN"
}

# Grant ownership of HCPUSER role to SYSADMIN
resource "snowflake_role_ownership_grant" "role_ownership_transfer" {
  role_name = snowflake_account_role.hcpuser.name
  to_role   = "SYSADMIN"
  
  # This ensures the grant happens after the role is managed by Terraform
  depends_on = [snowflake_account_role.hcpuser]
}
