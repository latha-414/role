# Import the existing HCPUSER role (using new resource type)
resource "snowflake_account_role" "hcpuser" {
  name    = "HCPUSER"
  comment = "HCP User role - ownership transferred to SYSADMIN"
}

# Grant ownership of HCPUSER role to SYSADMIN
resource "snowflake_grant_ownership" "hcpuser_ownership" {
  on {
    object_type = "ROLE"
    object_name = snowflake_account_role.hcpuser.name
  }
  
  to {
    account_role_name = "SYSADMIN"
  }
  
  # This ensures the grant happens after the role is managed by Terraform
  depends_on = [snowflake_account_role.hcpuser]
}
