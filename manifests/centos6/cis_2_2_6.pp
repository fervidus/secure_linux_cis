#
class secure_linux_cis::cis_centos6::cis_2_2_6 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ldap_server_is_not_enabled
}
