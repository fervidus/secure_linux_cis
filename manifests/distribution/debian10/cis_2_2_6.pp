# @api private
#
class secure_linux_cis::distribution::debian10::cis_2_2_6 {
  include secure_linux_cis::rules::ensure_ldap_server_is_not_enabled
}
