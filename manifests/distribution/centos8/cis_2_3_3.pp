# @api private
#
class secure_linux_cis::distribution::centos8::cis_2_3_3 {
  include secure_linux_cis::rules::ensure_LDAP_client_is_not_installed
}
