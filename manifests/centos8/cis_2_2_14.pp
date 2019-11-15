#
class secure_linux_cis::centos8::cis_2_2_14 {
  include secure_linux_cis::rules::ensure_LDAP_server_is_not_enabled
}
