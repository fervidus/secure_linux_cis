# @api private
#
class secure_linux_cis::distribution::amazon2::cis_2_1_5 {
  include secure_linux_cis::rules::ensure_dhcp_server_is_not_enabled
}
