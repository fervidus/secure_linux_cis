#
class secure_linux_cis::amazon2::cis_2_2_5 {
  include secure_linux_cis::rules::ensure_ldap_client_is_not_installed
}
