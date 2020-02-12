# @api private
#
class secure_linux_cis::distribution::rhel8::cis_2_2_15 {
  include secure_linux_cis::rules::ensure_dhcp_server_is_not_enabled
}
