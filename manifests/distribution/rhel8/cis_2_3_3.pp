#
class secure_linux_cis::distribution::rhel8::cis_2_3_3 {
  include secure_linux_cis::rules::ensure_ldap_client_is_not_installed
}
