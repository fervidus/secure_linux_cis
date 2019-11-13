#
class secure_linux_cis::cis_oracle7::cis_2_3_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ldap_client_is_not_installed
}
