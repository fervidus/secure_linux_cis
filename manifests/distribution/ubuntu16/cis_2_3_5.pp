#
class secure_linux_cis::distribution::ubuntu16::cis_2_3_5 {
  include secure_linux_cis::rules::ensure_ldap_client_is_not_installed
}
